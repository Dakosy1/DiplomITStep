import Foundation
import AVFAudio
import AVFoundation

struct ArabicLetter: Identifiable {
    let id = UUID()
    let letter: String
    let transcription: String
    let audioFileName: String
}


let arabicAlphabet: [ArabicLetter] = [
    ArabicLetter(letter: "ا", transcription: "aa", audioFileName: "001-alif.mp3"),
    ArabicLetter(letter: "ب", transcription: "b", audioFileName: "ba.mp3"),
    ArabicLetter(letter: "ت", transcription: "t", audioFileName: "003-taa.mp3"),
    ArabicLetter(letter: "ث", transcription: "th", audioFileName: "004-tha.mp3"),
    ArabicLetter(letter: "ج", transcription: "j", audioFileName: "005-jeem.mp3"),
    ArabicLetter(letter: "ح", transcription: "H", audioFileName: "006-haa.mp3"),
    ArabicLetter(letter: "خ", transcription: "kh", audioFileName: "007-khaa.mp3"),
    ArabicLetter(letter: "د", transcription: "d", audioFileName: "008-dal.mp3"),
    ArabicLetter(letter: "ذ", transcription: "dh", audioFileName: "009-dhal.mp3"),
    ArabicLetter(letter: "ر", transcription: "r", audioFileName: "010-raa.mp3"),
    ArabicLetter(letter: "ز", transcription: "z", audioFileName: "012-seen.mp3"),
    ArabicLetter(letter: "س", transcription: "s", audioFileName: "013-sheen.mp3"),
    ArabicLetter(letter: "ش", transcription: "sh", audioFileName: "014-saad.mp3"),
    ArabicLetter(letter: "ص", transcription: "S", audioFileName: "015-dhaad.mp3"),
    ArabicLetter(letter: "ض", transcription: "D", audioFileName: "016-toa.mp3"),
    ArabicLetter(letter: "ط", transcription: "T", audioFileName: "017-dhaa.mp3"),
    ArabicLetter(letter: "ظ", transcription: "DH", audioFileName: "018-ain.mp3"),
    ArabicLetter(letter: "ع", transcription: "3", audioFileName: "019-ghain.mp3"),
    ArabicLetter(letter: "غ", transcription: "gh", audioFileName: "020-faa.mp3"),
    ArabicLetter(letter: "ف", transcription: "f", audioFileName: "021-qaaf.mp3"),
    ArabicLetter(letter: "ق", transcription: "q", audioFileName: "022-kaaf.mp3"),
    ArabicLetter(letter: "ك", transcription: "k", audioFileName: "023-laam.mp3"),
    ArabicLetter(letter: "ل", transcription: "l", audioFileName: "024-meem.mp3"),
    ArabicLetter(letter: "م", transcription: "m", audioFileName: "025-noon.mp3"),
    ArabicLetter(letter: "ن", transcription: "n", audioFileName: "026-waw.mp3"),
    ArabicLetter(letter: "ه", transcription: "h", audioFileName: "027-ha.mp3"),
    ArabicLetter(letter: "و", transcription: "w", audioFileName: "028-hamza.mp3"),
    ArabicLetter(letter: "ي", transcription: "y", audioFileName: "029-yaa.mp3")
]
