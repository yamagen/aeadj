<!--
https://chatgpt.com/c/69eccee5-5ec8-83ab-ac7b-6bac553de926
Dropbox/pub/aeadj/github/aeadj/notes/20260621aead-moushiokuri-ja.md
-->

# 申し送り: AEAD No.801-803 と即時文法の理論展開

このスレッドでは、AEAD が No.800 に到達した後、No.801-803 を進めながら、即時文法 (Immediate Grammar) の理論的な位置づけがかなり深まった。

## 重要な運用方針

AEAD では、今後 `notes-for-research` と `notes-for-teachers` を毎項目に付ける方針はやめる。

理由は、別スレッドで申し送りを渡したにもかかわらず、AI が既存の正しい表現を壊したり、トンチンカンな補足を作ったりしたため。特に、

```json
"index": "sorehanaideshou",
"title": "That's not fair!",
"expression-ja": "それはないでしょう！",
"roman-ja": "Sore wa nai deshou!",
"expression-en": "That's not fair!"
```

はすでに正しかったのに、`That's too much.` に変更されてしまった。これは誤り。

`それはないでしょう！` の中心は「それは不公平だ」「それは筋が通らない」「それはひどい」「それは受け入れられない」という抗議であり、主訳は `That's not fair!` がよい。`That's too much.` は「やりすぎ」「度を越している」「負担が大きすぎる」に寄り、方向が違う。

したがって今後は、AEAD 本体の品質を守ることを優先する。

基本方針:

```text
通常 notes-ja/en:
  学習者にも読める短く平易な説明にする。

notes-for-research / notes-for-teachers:
  原則として付けない。
  ユーザーが明示的に求めたとき、または別メモとして切り出すときだけ扱う。

見直し:
  「改善」ではなく「破損チェック」と考える。
  すでに自然な主訳を勝手に別案へ置換しない。
```

## No.801「こんなことなんて今までなかったのに。」

ユーザー提示:

```json
{
  "date": "2026.06.20",
  "day": "Sat",
  "number": 801,
  "index": "konnakotonante",
  "title": "This kind of thing never happened before.",
  "expression-ja": "こんなことなんて(今:いま)までなかったのに。",
  "roman-ja": "Konna koto nante ima made nakatta noni.",
  "expression-en": "This kind of thing never happened before."
}
```

修正方針:

`This kind of thing never happened before.` でも意味は通るが、会話の自然さとしては、

```json
"expression-en": "This has never happened before."
```

がよい。

この表現の核は「新しい状況」だけでなく、**経験則が破られたことへの戸惑い**。
「今までこんなことはなかった」「いつもと違う」「だから不安だ」という感じ。

最終案:

```json
{
  "date": "2026.06.20",
  "day": "Sat",
  "number": 801,
  "index": "konnakotonante",
  "title": "This has never happened before.",
  "expression-ja": "こんなことなんて(今:いま)までなかったのに。",
  "roman-ja": "Konna koto nante ima made nakatta noni.",
  "expression-en": "This has never happened before.",
  "variants-ja": ["こんなこと、今までなかったのに。", "こんなこと、今まで起きたことがなかったのに。", "こんなこと、今まで経験したことがなかったのに。"],
  "variants-en": ["This has never happened before.", "This kind of thing has never happened before.", "I have never experienced anything like this before."],
  "intent-ja": ["異常さへの戸惑い", "予想外の状況の表現", "口語的な表現"],
  "intent-en": ["confusion about something unusual", "expression of an unexpected situation", "colloquial expression"],
  "tags-ja": ["即時文法", "口語", "異常事態表現", "予想外表現", "戸惑い表現"],
  "tags-en": ["immediate grammar", "spoken", "unusual-situation expression", "unexpected-situation expression", "confusion expression"],
  "adjusted-expression-ja": "(今:いま)まで、こんなことは(起:お)きたことがなかったのに。",
  "adjusted-expression-en": "Until now, this kind of thing had never happened.",
  "img-sub": "konnakotonante01.png",
  "example-ja": "A「(バス:ばす)、こないねぇ」 B「そうねぇ、こんなことなんて(今:いま)までなかったのに」",
  "example-en": "A: The bus isn't coming, huh. B: Yeah, this has never happened before.",
  "notes-ja": "「こんなことなんて今までなかったのに」は、これまで起きたことのない状況に対して、驚きや戸惑いを表す表現です。「なんて」によって、ただの事実説明ではなく、「こんな変なことが起きるとは思わなかった」という気持ちが出ています。",
  "notes-en": "'Konna koto nante ima made nakatta noni.' is used to express surprise or confusion about something that has never happened before. 'Nante' makes it more than a factual statement; it gives the feeling of 'I never expected something like this to happen.'"
}
```

## No.802「すやすやと眠っている。」

ユーザー提示:

```json
{
  "date": "2026.06.21",
  "day": "Sun",
  "number": 802,
  "index": "suyasuya",
  "title": "Soundly sleeping.",
  "expression-ja": "(すやすや)と(眠:ねむ)っている。",
  "roman-ja": "Suyasuya to nemutte iru.",
  "expression-en": "Soundly sleeping."
}
```

修正点:

1. `すやすや` にルビは不要。

```json
"expression-ja": "すやすやと(眠:ねむ)っている。"
```

2. `Soundly sleeping.` でも意味は通るが、`すやすや` は「ぐっすり」だけでなく、静かで穏やかな感じが強い。主訳は

```json
"expression-en": "Sleeping peacefully."
```

がよい。

3. 例文の英語は、`my baby` ではなく `the baby` が自然。

日本語:

```json
"example-ja": "A「(赤:あか)ちゃん、(眠:ねむ)ってる？」 B「いや、お(父:とう)さんの(方:ほう)が、すやすやと(眠:ねむ)ってるけど」"
```

英語:

```json
"example-en": "A: Is the baby asleep? B: No, actually, Dad is the one sleeping peacefully."
```

`the baby` は「その場で共有されている赤ちゃん」を指す。家庭内の会話では、母親も父親もどの赤ちゃんか分かっているので、`my baby` と言う必要がない。`my baby` と言うと、「私の赤ちゃん」という所有・関係を前に出しすぎる。

ただし、病院・保育所・親権・取り違えなど、「誰の赤ちゃんか」が問題になる場面では `my baby`, `my child`, `my son`, `my daughter` が自然になる。

この例から、英語の `the` と `my` は単なる文法項目ではなく、即時空間での共有対象・所有主張・関係づけによって決まることが見えた。

最終案:

```json
{
  "date": "2026.06.21",
  "day": "Sun",
  "number": 802,
  "index": "suyasuya",
  "title": "Sleeping peacefully.",
  "expression-ja": "すやすやと(眠:ねむ)っている。",
  "roman-ja": "Suyasuya to nemutte iru.",
  "expression-en": "Sleeping peacefully.",
  "variants-ja": ["すやすやと眠っている。", "すやすや眠っている。", "すやすやと寝ている。"],
  "variants-en": ["Sleeping peacefully.", "Sleeping soundly.", "Sound asleep."],
  "intent-ja": ["睡眠の様子の表現", "穏やかな状態の表現", "口語的な表現"],
  "intent-en": ["expression of sleep state", "expression of peaceful condition", "colloquial expression"],
  "tags-ja": ["即時文法", "口語", "オノマトペ", "睡眠状態表現", "穏やか状態表現"],
  "tags-en": ["immediate grammar", "spoken", "onomatopoeia", "sleep-state expression", "peaceful-condition expression"],
  "adjusted-expression-ja": "すやすやと(眠:ねむ)っています。",
  "adjusted-expression-en": "They are sleeping peacefully.",
  "img-sub": "suyasuya01.png",
  "example-ja": "A「(赤:あか)ちゃん、(眠:ねむ)ってる？」 B「いや、お(父:とう)さんの(方:ほう)が、すやすやと(眠:ねむ)ってるけど」",
  "example-en": "A: Is the baby asleep? B: No, actually, Dad is the one sleeping peacefully.",
  "notes-ja": "「すやすや」は、静かに気持ちよさそうに眠っている様子を表すオノマトペです。赤ちゃんや子どもに使われることが多いですが、大人が安心して眠っている様子にも使えます。例文では、赤ちゃんではなくお父さんが眠っているところが少しおかしく聞こえます。",
  "notes-en": "'Suyasuya' is an onomatopoeic expression for sleeping quietly and peacefully. It is often used for babies or children, but it can also describe an adult sleeping comfortably. In the example, the funny point is that it is not the baby but the father who is sleeping peacefully."
}
```

重要な観察:

単純に、

```json
"example-ja": "赤ちゃんがすやすや寝ています。"
```

にしなくてよかった。これではただの語義例になる。

今回の例文では、普通なら赤ちゃんに使いそうな `すやすや` を、お父さんに使っているので、予想のズレが出る。また、「赤ちゃん、眠ってる？」を英語にするとき、`my baby` ではなく `the baby` になる理由も見えた。これにより、冠詞・所有・共有対象の問題が現れた。

## 即時文法の理論展開: 即時空間の厳格なルール

このスレッドで重要な理論的整理が出た。

即時文法は、「曖昧な会話の感じ」を扱うものではない。むしろ、**即時世界には即時世界の厳格なルールがある**という考え方である。

ユーザーの定式化:

```text
即時、つまり、目の前の発話には厳格にそう言わなければならないルールがある。
調整文法にも、恒常的に意味を維持させるにはどういうルールがあるか、という問題がある。
```

整理:

```text
即時文法:
  目の前の発話状況において、
  なぜこの形で言わなければならないのかを説明する文法。

調整文法:
  時間がたっても、場面が変わっても、
  意味や形式の一貫性を保つための文法。
```

さらに簡潔に言うと:

```text
即時文法は、場面に対して形式を拘束する。
調整文法は、時間と文脈を超えて意味を維持する。
```

今回の例:

```text
Is the baby asleep?
```

これは、ただ `the = 特定` だからではない。話し手と聞き手が同じ赤ちゃんを共有対象として扱っているから `the baby` でなければならない。ここで `my baby` にすると、所有・関係・権利の主張が出てしまい、即時世界の構造が変わる。

同じように、

```text
あ、電源かぁ。
```

は「電源が原因です」ではない。相手の指摘を受けて、原因候補に今気づいた場面だから、この形になる。

```text
それ、微妙。
```

は「それは悪いです」ではない。はっきり否定すると関係が荒れるが、肯定もできない。だから即時空間では「微妙」という形で評価を返す理由がある。

即時文法の研究対象は、

```text
即時空間の制約が、表現形式をどう決めるか
```

である。

ユーザーは、即時空間での厳格なルールの研究はまだ十分に積み上げられていない、と考えている。これは PGM の重要な研究ギャップ。

## No.690「あれ、なんだけど」

No.690 の表現:

```json
"expression-ja": "(急:きゅう)にこんなこと(聞:き)くのも、あれ、なんだけど、...",
"roman-ja": "Kyuu ni konna koto kiku no mo, are, nan da kedo, ...",
"expression-en": "It's a bit awkward to ask this suddenly, but..."
```

重要な観察:

この場合の「あれ」は、「話し手も聞き手も知っているもの」を指しているわけではない。
むしろ、話し手も聞き手も「あれ」の正体を明確には分かっていない。

ここで「あれ」が受けているのは、具体的な物でも、既知の対象でもなく、

```text
ちょっと失礼かもしれない
ちょっと変かもしれない
ちょっと踏み込みすぎかもしれない
ちょっと言いにくい
```

という、まだ名前をつけたくない対人的な不都合である。

別の語にすると壊れる。

```text
急にこんなこと聞くのも、失礼なんだけど、...
```

だと、自分の発話を「失礼」と確定してしまう。

```text
急にこんなこと聞くのも、変なんだけど、...
```

だと、「変」という評価が前に出すぎる。

```text
急にこんなこと聞くのも、申し訳ないんだけど、...
```

だと、謝罪に寄りすぎる。

しかし、

```text
急にこんなこと聞くのも、あれ、なんだけど、...
```

なら、失礼・変・踏み込みすぎ・言いにくさを、どれか一つに固定しないまま、相手に「言いにくいことを聞こうとしている」ことを伝えられる。

この「あれ」は、共有された既知対象ではなく、**共有可能な未確定の違和感**を指している。
正体が分かっているから「あれ」なのではなく、正体を言わずに済ませるために「あれ」なのだ。

これは即時文法の重要例。

## No.803「そんなことば、どこで覚えたの？」

ユーザー提示:

```json
{
  "date": "2026.06.22",
  "day": "Mon",
  "number": 803,
  "index": "sonnakotoba",
  "title": "Where did you learn that word?",
  "expression-ja": "そんなことば、どこで(覚:おぼ)えたの？",
  "roman-ja": "Sonna kotoba, doko de oboeta no?",
  "expression-en": "Where did you learn that word?"
}
```

修正点:

1. `variants-ja` に同じものが二つ入っていた。

元:

```json
"variants-ja": ["そんなことば、どこで覚えたの？", "そんなことば、どこで覚えたの？", "そんなことば、どこで知ったの？"]
```

修正:

```json
"variants-ja": ["そんなことば、どこで覚えたの？", "そんなことば、どこで聞いたの？", "そんなことば、どこで知ったの？"]
```

2. notes の「そのことばが自分の語彙にはない」は少し違う。大人は「コンプラ的にアウト」を知っている。問題は、**子どもがその語を使ったことが意外** という点。

3. 例文英語では、`word` より `phrase` が自然。
   「コンプラ的にアウト」は一語ではなく言い回しだから。

最終案:

```json
{
  "date": "2026.06.22",
  "day": "Mon",
  "number": 803,
  "index": "sonnakotoba",
  "title": "Where did you learn that word?",
  "expression-ja": "そんなことば、どこで(覚:おぼ)えたの？",
  "roman-ja": "Sonna kotoba, doko de oboeta no?",
  "expression-en": "Where did you learn that word?",
  "variants-ja": ["そんなことば、どこで覚えたの？", "そんなことば、どこで聞いたの？", "そんなことば、どこで知ったの？"],
  "variants-en": ["Where did you learn that word?", "Where did you hear that word?", "Where did you come across that word?"],
  "intent-ja": ["驚きの表現", "ことばの出どころ確認", "口語的な表現"],
  "intent-en": ["expression of surprise", "asking where a word came from", "colloquial expression"],
  "tags-ja": ["即時文法", "口語", "驚き表現", "ことば出どころ確認表現", "口語的表現"],
  "tags-en": ["immediate grammar", "spoken", "surprise expression", "word-origin-checking expression", "colloquial expression"],
  "adjusted-expression-ja": "そのようなことばを、どこで(覚:おぼ)えたのですか？",
  "adjusted-expression-en": "Where did you learn such a word?",
  "img-sub": "sonnakotoba01.png",
  "example-ja": "A「(パパ:ぱぱ)、それ、(コンプラ的:こんぷらてき)に(アウト:あうと)じゃない？」 B「(レイ:れい)ちゃん、そんなことば、どこで(覚:おぼ)えたの？」",
  "example-en": "A: Dad, isn't that kind of a compliance issue? B: Rei-chan, where did you learn that phrase?",
  "notes-ja": "「そんなことば、どこで覚えたの？」は、相手がその人らしくないことばや、大人びたことばを使ったときの驚きを表す表現です。「そんなことば」によって、ことばそのものだけでなく、その人がそのことばを使ったことへの意外さが出ています。例文では、子どもが「コンプラ的にアウト」という大人のような言い方をしているため、B が驚いています。",
  "notes-en": "'Sonna kotoba, doko de oboeta no?' is used when someone uses a word or phrase that feels unexpected for them, such as a very grown-up expression from a child. 'Sonna kotoba' points not only to the word itself, but also to the surprise that this person used it. In the example, Rei-chan says 'konpura-teki ni auto,' a very adult-sounding phrase, so B reacts with surprise."
}
```

重要な観察:

「そんなことば、どこで覚えたの？」は、表面上は「出どころ」を聞いているが、実際には単なる情報質問ではない。

ここには、

```text
驚き
出どころ確認
軽い注意
成長への反応
ことばの不釣り合いへの反応
```

が重なっている。

ことばそのものではなく、**そのことばがその子の口から出たこと**に驚いている。

## 感情名・行為名を使わない表現

このスレッドで非常に重要な視点が出た。

本当に驚いているとき、人は普通、

```text
私は驚いています。
```

とは言わない。

実際には、

```text
えっ？
うそ。
まじで？
そんなことある？
どこで覚えたの？
```

のように言う。

つまり、**感情名を言わずに、その感情の反応を言う**。

同じように、

```text
あ、これこれ。
```

は、「私はこれを探していました」とは言っていないのに、探していたものが見つかったことを表す。

この系列はリスト化できる。

```text
あ、これこれ。
  → 探していたものが見つかった。

あ、そこそこ。
  → 探していた場所・押してほしい場所・指してほしい位置が合った。

あ、それそれ。
  → 相手が言ったものが、自分の言いたかったものと合った。

えっ、なんで？
  → 予想外で理解できない。

そんなことば、どこで覚えたの？
  → その人がそのことばを使ったことに驚いている。

あ、電源かぁ。
  → 指摘を受けて、原因に気づいた。

ああ、そうだったんだ。
  → 説明を受けて、事情が分かった。

それ、微妙。
  → そのまま賛成しにくいが、強く否定もしない。

独特な雰囲気があるね。
  → はっきり褒めるとは限らないが、個性として受け止めている。

後でいいから。
  → 相手を急がせない。

無理を承知で言えば、...
  → 相手に負担がかかることを先に認めている。
```

普通の文法や語彙リストでは、これらは落ちる。
なぜなら、表面には「驚く」「探す」「気づく」「配慮する」「断る」などの単語が出ていないから。

しかし、実際の会話では、むしろこちらの方が自然。

```text
驚いています。
探していました。
今、気づきました。
あなたに配慮しています。
私は判断を保留しています。
```

とは言わず、かわりに、

```text
えっ？
あ、これこれ。
あ、電源かぁ。
後でいいから。
それ、微妙。
```

と言う。

この視点は、AEAD/PGM の論文テーマになる。

## 論文案: 言わずに表す発話機能

論文の中心:

```text
感情名・行為名・状態名を使わなくても、
その感情・行為・状態が発話として表現される。
しかも、それは自由な言い換えではなく、
即時空間の条件によって形式がかなり厳格に決まる。
```

必要な例の型:

### 1. 「驚く」と言わない驚き

```text
そんなことば、どこで覚えたの？
えっ、なんで？
うそでしょ。
そんなことある？
まじで？
```

### 2. 「探していた」と言わない探索完了

```text
あ、これこれ。
あ、それそれ。
あ、そこそこ。
```

違い:

```text
これ。
  → 対象の指示

あ、これ。
  → 対象への気づき

あ、これこれ。
  → 探していたものとの一致
```

### 3. 「気づいた」と言わない気づき

```text
あ、電源かぁ。
ああ、そうだったんだ。
あ、そこか。
ああ、置き場所かぁ。
```

### 4. 「否定する」と言わない否定的評価

```text
それ、微妙。
独特な雰囲気があるね。
```

### 5. 「配慮する」と言わない配慮

```text
後でいいから。
無理を承知で言えば、...
急にこんなこと聞くのも、あれ、なんだけど、...
```

### 6. 「共有されている」と言わない共有対象

```text
Is the baby asleep?
```

これは `the = 特定` というだけでは不十分。
話し手と聞き手が、その赤ちゃんを共有対象として扱っているから `the baby` になる。
`my baby` にすると、所有・関係・権利の主張が出る。

論文の最小セット:

```text
1. そんなことば、どこで覚えたの？
   驚くと言わない驚き

2. あ、これこれ。
   探していたと言わない探索完了

3. あ、電源かぁ。
   気づいたと言わない気づき

4. それ、微妙。
   否定すると言わない否定的評価

5. 後でいいから。
   配慮すると言わない配慮

6. 急にこんなこと聞くのも、あれ、なんだけど、...
   名づけないまま対人的な不都合を処理する
```

補助例:

```text
独特な雰囲気があるね。
ああ、そうだったんだ。
ああ、置き場所かぁ。
Is the baby asleep?
```

## 論文タイトル案

日本語タイトル候補:

```text
言わずに表す発話機能: 即時空間における形式拘束の記述
```

または、

```text
即時空間の文法: 明示語なしに機能する発話表現の規則性
```

または、

```text
「驚く」と言わない驚き: 即時空間における発話形式の拘束
```

ただし、「驚き」だけに寄ると狭くなるので、広く書くなら、

```text
言わずに表す発話機能: 即時空間における形式拘束の記述
```

がよさそう。

英語タイトル候補:

```text
Functions Without Naming: A Study of Immediate Grammar
```

または、

```text
Utterance Functions Without Explicit Naming in Immediate Grammar
```

または、

```text
Utterance Functions Without Explicit Naming: Formal Constraints in Immediate Grammar
```

または、

```text
Saying Without Naming: Immediate Grammar and the Constraints of Situated Utterances
```

ユーザーが確認した表現:

```text
function in immediate grammar
```

方向としては合っている。ただし英語タイトルとしては単数の `function` では弱い。
論文タイトルなら、

```text
Utterance Functions in Immediate Grammar
```

または今回の核心を出して、

```text
Functions Without Naming in Immediate Grammar
```

がよい。

キーワード案:

```text
immediate grammar
utterance function
explicit naming
situated utterance
formal constraint
```

## 今後の注意

このスレッドで得られた大事な定式化:

```text
即時文法は、場面に対して形式を拘束する。
調整文法は、時間と文脈を超えて意味を維持する。
```

そして、

```text
即時空間には、即時空間の厳格なルールがある。
```

これは今後の PGM 論文・AEAD 論文で中心的に使える。
