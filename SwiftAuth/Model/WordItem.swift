import Foundation
import RealmSwift

class WordItem: Object, Identifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var location: String = "TR"
    @Persisted var mainWord: String = ""
    @Persisted var wordTranslate: String = ""
    @Persisted var wordDescription: String = ""
    @Persisted var weight: Int = 0
    
    override class func primaryKey() -> String? {
        "id"
    }
}
