package sjis

import "core:slice"

// kanji (Shift JIS encoding) commonly used for aliases and/or voice colors
common_kanji :: []u16{
    0x8aaa, // 巻
    0x8ba9, // 叫
    0x9197, // 息
    0x97cd, // 力
    0x9a91, // 囁
}

// remember that if you need extra kanji to be added,
to_utf8 :: proc(from: [2]u8) -> Maybe([2]u8) {
    from_u16 :: (u16(from[0]) << 8) | u16(from[1])
    
    if from_u16 > 0x889e && !slice.contains(common_kanji, from_u16) do return nil // those'd be kanji, we only need the most commonly used ones
    
    return [2]u8{}
}

from_utf8 :: proc(from: [2]u8) -> Maybe([2]u8) {
    
}

/*
    sjis kana and fullwidth latin table
    section taken from http://rikai.com/library/kanjitables/kanji_codes.sjis.shtml
    
    82 4f | ０ １ ２ ３ ４ ５ ６ ７ ８ ９                   
    82 5f |    Ａ Ｂ Ｃ Ｄ Ｅ Ｆ Ｇ Ｈ Ｉ Ｊ Ｋ Ｌ Ｍ Ｎ Ｏ 
    82 6f | Ｐ Ｑ Ｒ Ｓ Ｔ Ｕ Ｖ Ｗ Ｘ Ｙ Ｚ                
    82 80 |    ａ ｂ ｃ ｄ ｅ ｆ ｇ ｈ ｉ ｊ ｋ ｌ ｍ ｎ ｏ 
    82 90 | ｐ ｑ ｒ ｓ ｔ ｕ ｖ ｗ ｘ ｙ ｚ                
    82 9e |    ぁ あ ぃ い ぅ う ぇ え ぉ お か が き ぎ く 
    82 ae | ぐ け げ こ ご さ ざ し じ す ず せ ぜ そ ぞ た 
    82 be | だ ち ぢ っ つ づ て で と ど な に ぬ ね の は 
    82 ce | ば ぱ ひ び ぴ ふ ぶ ぷ へ べ ぺ ほ ぼ ぽ ま み 
    82 de | む め も ゃ や ゅ ゆ ょ よ ら り る れ ろ ゎ わ 
    82 ee | ゐ ゑ を ん                                     
    83 3f |    ァ ア ィ イ ゥ ウ ェ エ ォ オ カ ガ キ ギ ク 
    83 4f | グ ケ ゲ コ ゴ サ ザ シ ジ ス ズ セ ゼ ソ ゾ タ 
    83 5f | ダ チ ヂ ッ ツ ヅ テ デ ト ド ナ ニ ヌ ネ ノ ハ 
    83 6f | バ パ ヒ ビ ピ フ ブ プ ヘ ベ ペ ホ ボ ポ マ ミ 
    83 80 | ム メ モ ャ ヤ ュ ユ ョ ヨ ラ リ ル レ ロ ヮ ワ 
    83 90 | ヰ ヱ ヲ ン ヴ ヵ ヶ                            
    
    -- latin script
    sjis 005c => utf8 00a5
    sjis 007d => utf8 203e
    sjis 007f => utf8 00a5
    
    -- full-width latin
    sjis 824f => utf8 0ff10
    
    -- (basic) kana
    sjis 829e => utf8 3040
    sjis 833f => utf8 30A0
*/

