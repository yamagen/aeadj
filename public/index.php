<?php


function highlightKeyword($text, $keyword) {
    if ($keyword === '') return htmlspecialchars($text);
    $escapedKeyword = preg_quote($keyword, '/');
    return preg_replace_callback("/($escapedKeyword)/iu", function($m) {
        return '<span class="blue">' . htmlspecialchars($m[1]) . '</span>';
    }, htmlspecialchars($text));
}


function convertRuby($text) {
    return preg_replace_callback(
        '/\(([^:()]+):([^\)]+)\)/',
        function($matches) {
            return "<ruby>{$matches[1]}<rt>{$matches[2]}</rt></ruby>";
        },
        $text
    );
}


//$jsonPath = realpath('/var/www/aeadj/aead.json');
$jsonPath = realpath(__DIR__ . '/../aeadj/aead.json');

if (!file_exists($jsonPath)) {
    echo "Error: aead.json not found.";
    exit;
}

$data = json_decode(file_get_contents($jsonPath), true);
$query = $_GET['q'] ?? '';

$results = [];
if ($query !== '') {
    foreach ($data as $entry) {
        $exprJa = $entry['expression-ja'] ?? '';
        $exprEn = $entry['expression-en'] ?? '';

        if (stripos($exprJa, $query) !== false || stripos($exprEn, $query) !== false) {
            $results[] = $entry;
        }
    }
}
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>AEAD Search</title>
  <style>
    h1 {
      text-decoration: none;
      /* リンクの下線を消す */
      color: #006D67;
      /* リンクの色を親要素に合わせる */
    }

    .themecolor {
      color: #006D67;
      /* テーマカラーを設定 */
    }

    .header {
      display: flex;
      align-items: center;
      /* ロゴとテキストブロックの縦位置を中央揃え */
      gap: 20px;
      /* ロゴと右側の間の余白 */
      margin-bottom: 20px;
    }

    .logo {
      width: 160px;
      /* ロゴの幅を制限 */
      max-height: 160px;
      max-width: 160px;
      /* ロゴのサイズを制限 */
    }

    .title-form {
      display: flex;
      flex-direction: column;
      /* 縦に並べる */
      justify-content: center;
      /* 高さをロゴ中央に合わせる */
    }

    .search-form {
      display: flex;
      gap: 8px;
    }

    .blue {
      background-color: #cce5ff;
      padding: 0 2px;
      border-radius: 3px;
    }
  </style>
</head>

<body>

  <div class="header">
    <a href="https://cuckoo.js.ila.titech.ac.jp/~yamagen/picture/">
      <img class="logo" src="images/colloqjseal01.png" alt="Logo">
    </a>
    <div class="title-form">
      <h1>AEAD Search</h1>
      <form method="get" class="search-form">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="検索語を入力">
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
      <strong>
        <?= convertRuby(highlightKeyword($item['expression-ja'] ?? '', $query)) ?>
      </strong>
      /
      <?= highlightKeyword($item['expression-en'] ?? '', $query) ?><br>
      <em>
        <?= convertRuby(highlightKeyword($item['adjusted-expression-ja'] ?? '', $query)) ?>
      </em>
    </li>

    <?php endforeach; ?>
  </ol>

</body>

</html>
