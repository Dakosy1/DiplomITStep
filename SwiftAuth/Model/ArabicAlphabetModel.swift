import Foundation

struct ArabicLetter: Identifiable {
    let id = UUID()
    let letter: String
    let transcription: String
}

let arabicAlphabet: [ArabicLetter] = [
    ArabicLetter(letter: "ا", transcription: "aa"),
    ArabicLetter(letter: "ب", transcription: "b"),
    ArabicLetter(letter: "ت", transcription: "t"),
    ArabicLetter(letter: "ث", transcription: "th"),
    ArabicLetter(letter: "ج", transcription: "j"),
    ArabicLetter(letter: "ح", transcription: "H"),
    ArabicLetter(letter: "خ", transcription: "kh"),
    ArabicLetter(letter: "د", transcription: "d"),
    ArabicLetter(letter: "ذ", transcription: "dh"),
    ArabicLetter(letter: "ر", transcription: "r"),
    ArabicLetter(letter: "ز", transcription: "z"),
    ArabicLetter(letter: "س", transcription: "s"),
    ArabicLetter(letter: "ش", transcription: "sh"),
    ArabicLetter(letter: "ص", transcription: "S"),
    ArabicLetter(letter: "ض", transcription: "D"),
    ArabicLetter(letter: "ط", transcription: "T"),
    ArabicLetter(letter: "ظ", transcription: "DH"),
    ArabicLetter(letter: "ع", transcription: "3"),
    ArabicLetter(letter: "غ", transcription: "gh"),
    ArabicLetter(letter: "ف", transcription: "f"),
    ArabicLetter(letter: "ق", transcription: "q"),
    ArabicLetter(letter: "ك", transcription: "k"),
    ArabicLetter(letter: "ل", transcription: "l"),
    ArabicLetter(letter: "م", transcription: "m"),
    ArabicLetter(letter: "ن", transcription: "n"),
    ArabicLetter(letter: "ه", transcription: "h"),
    ArabicLetter(letter: "و", transcription: "w"),
    ArabicLetter(letter: "ي", transcription: "y")
]
