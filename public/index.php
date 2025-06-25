<?php


// 🔧 検索キーワードにマッチする部分をハイライト
function highlightKeyword($text, $keyword) {
    if ($keyword === '') return htmlspecialchars($text ?? '');
    $escapedKeyword = preg_quote($keyword, '/');
    return preg_replace_callback(
        "/($escapedKeyword)/iu",
        function($m) {
            return '<span class="blue">' . htmlspecialchars($m[1]) . '</span>';
        },
        htmlspecialchars($text ?? '')
    );
}

// 🔧 ルビ記法 "(漢字:よみ)" を <ruby> 漢字 <rt>よみ</rt> </ruby> に変換
function convertRuby($text) {
    return preg_replace_callback(
        '/\(([^:()]+):([^)]+)\)/',
        function($matches) {
            return "<ruby>{$matches[1]}<rt>{$matches[2]}</rt></ruby>";
        },
        $text ?? ''
    );
}

$css_mtime = filemtime("style.css");

// 📁 JSONファイルの読み込み
$jsonPath = realpath(__DIR__ . '/../aeadj/aead.json');

if (!file_exists($jsonPath)) {
    echo "Error: aead.json not found.";
    exit;
}

$data = json_decode(file_get_contents($jsonPath), true);

// 🔎 クエリとエントリ番号を取得（GETパラメータ）
$query = htmlspecialchars($_GET['q'] ?? '', ENT_QUOTES, 'UTF-8');
$entryId = $_GET['entry'] ?? null;

// 🔍 個別エントリが指定されている場合はそれを探す
if ($entryId !== null) {
    foreach ($data as $entry) {
        if ((string)$entry['number'] === $entryId) {
            $selectedEntry = $entry;
            break;
        }
    }

    if (!isset($selectedEntry)) {
        echo "<p>Entry not found.</p>";
        exit;
    }
}

// 🔍 通常の検索処理
$results = [];
if ($query !== '') {
    foreach ($data as $entry) {
        $exprJa = $entry['expression-ja'] ?? '';
        $exprEn = $entry['expression-en'] ?? '';

        // ルビ表記 (漢字:かな) を かな に置き換える
        $kanaJa = preg_replace('/\(([^:]+):([^)]+)\)/u', '$2', $exprJa);

        if (stripos($kanaJa, $query) !== false || stripos($exprEn, $query) !== false) {
            $results[] = $entry;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AEAD Search</title>
  <link rel="stylesheet" href="style.css?v=<?= $css_mtime ?>">
</head>
<body>

  <?php if (isset($selectedEntry)): ?>
  <a href="?">← Back to Search</a>
  <h2>
    <?= convertRuby(highlightKeyword($selectedEntry['expression-ja'] ?? '', $query)) ?> /
    <?= highlightKeyword($selectedEntry['expression-en'] ?? '', $query) ?>
  </h2>
  <p><strong>Adjusted:</strong>
    <?= convertRuby(highlightKeyword($selectedEntry['adjusted-expression-ja'] ?? '', $query)) ?>
  </p>
  <p><strong>Example (JA):</strong>
    <?= convertRuby(highlightKeyword($selectedEntry['example-ja'] ?? '', $query)) ?>
  </p>
  <p><strong>Example (EN):</strong>
    <?= highlightKeyword($selectedEntry['example-en'] ?? '', $query) ?>
  </p>
  <p><strong>Notes (JA):</strong>
    <?= nl2br(convertRuby(highlightKeyword($selectedEntry['notes-ja'] ?? '', $query))) ?>
  </p>
  <p><strong>Notes (EN):</strong>
    <?= nl2br(highlightKeyword($selectedEntry['notes-en'] ?? '', $query)) ?>
  </p>

  <?php else: ?>
  <div class="header">
    <a href="https://cuckoo.js.ila.titech.ac.jp/~yamagen/picture/">
      <img class="logo" src="images/colloqjseal01.png" alt="Logo">
    </a>
    <div class="title-form">
      <h1 class="themecolor">AEAD Search</h1>
      <form method="get" class="search-form">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="Search expressions...">
        <button type="submit">Search</button>
      </form>
      <span class="themecolor">
        Reference for colloquial Japanese expressions in AEAD
        <br>
      </span>
      <a href="https://github.com/yamagen/aeadj" class="themecolor">
        Github: An Expression A Day
      </a>
    </div>
  </div>

  <ol>
    <?php foreach ($results as $item): ?>
    <li>
      <a href="?entry=<?= htmlspecialchars($item['number']) ?>">
        <strong>
          <?= convertRuby(highlightKeyword($item['expression-ja'] ?? '', $query)) ?>
        </strong>
      </a> /
      <?= highlightKeyword($item['expression-en'] ?? '', $query) ?><br>
      <em>
        <?= convertRuby(highlightKeyword($item['adjusted-expression-ja'] ?? '', $query)) ?>
      </em>
    </li>
    <?php endforeach; ?>
  </ol>
  <?php endif; ?>

</body>

</html>
