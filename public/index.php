<?php

function convertRuby($text) {
    return preg_replace_callback(
        '/\(([^:()]+):([^\)]+)\)/',
        function($matches) {
            return "<ruby>{$matches[1]}<rt>{$matches[2]}</rt></ruby>";
        },
        $text
    );
}


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

        if (strpos($exprJa, $query) !== false || strpos($exprEn, $query) !== false) {
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
</head>
<body>
    <h1>AEAD Search</h1>
    <form method="get">
        <input type="text" name="q" value="<?= htmlspecialchars($query) ?>" placeholder="検索語を入力">
        <button type="submit">Search</button>
    </form>

    <ul>

    <?php foreach ($results as $item): ?>
        <li>
            <strong>
               <?= convertRuby(htmlspecialchars($item['expression-ja'] ?? '')) ?>
            </strong>
             / <?= htmlspecialchars($item['expression-en'] ?? '') ?><br>
            <em><?= convertRuby(htmlspecialchars($item['adjusted-expression-ja'] ?? '')) ?></em>
        </li>
    <?php endforeach; ?>
    </ul>
</body>
</html>
