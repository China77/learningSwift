//
//  ViewController.swift
//  swift(Dictionary)
//
//  Created by 范云飞 on 2018/8/8.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dic = Dictionary<String, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:--------------------------- Dictionary ------------------------------
        
        //MARK:public init()
        /**
         \~chinese
         创建一个 Dictionary 对象
         
         \~english:
         creates an dictionary
         */
        
        
        /*\chinese: 定义一个可变字典  \english: creates an variable dictionary */
        var dic1 = [String: Any].init()
        print("dic1 is \(dic1)")
        
        /*\chinese: 定义一个不可变的字典  \english: creates an immutable dictioanry */
        let dic2 = ["name": "why", "age": 18] as [String : Any]
        print("dic2 is \(dic2)")
        
        /*\chinese: 声明一个字典  \english: declare an Dictionary */
        var dict3: Dictionary<String, Any>//swift 中任意对象，通常不适用NSObject,使用AnyObject
        
        
        //MARK:public init(minimumCapacity: Int)
        /**
         \~chinese
         创建一个 至少大于等于给定长度的 Dictionary 对象
         
         \~english:
         creates a dictionary with at least the given number of elements worth of buffer
         */
        var dict4 = [String: AnyObject].init(minimumCapacity: 2)
        dict4 = ["one": 1, "two": "seconde", "third": ["key": 2]] as [String : AnyObject]
        print("dict4 is \(dict4)")
        
        
        //MARK:public init<S>(uniqueKeysWithValues keysAndValues: S) where S : Sequence, S.Element == (Key, Value)
        /**
         \~chinese:
         创建一个新的dictionary 根据给定的一个 dictionary序列
         
         \~english:
         creates a new dictionary from the key-value pairs in the given sequence
         */
        
        let digitWords = ["one", "two", "three", "four", "five"]
        let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))
        print("wordToValue is \(wordToValue)")
        
        
        //MARK:public init<S>(_ keysAndValues: S, uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value) rethrows where S : sequence, S.Element == (key, Value)
        
        /**
         \~chinese:
         创建一个新的 dictionary 根据给定的 序列中的键值对，使用组合闭包来确定任何重复键对应的值
         
         \~english:
         creates  a new dictionary from the key-value pairs in the given sequence, using a combining closure to determine the value for any duplicate keys
         */
        let pairsWithDuplicateKeys = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
        let firstValues = Dictionary(pairsWithDuplicateKeys, uniquingKeysWith: { (first, _) in first })
        print("firstValues is \(firstValues)")
        
        let lastValues = Dictionary.init(pairsWithDuplicateKeys, uniquingKeysWith: { (_, first) in first })
        print("lastValues is \(lastValues)")
        
        
        //MARK:public init<S>(grouping values: S, by keyForValues: (S.Element) throws -> Dictionary.Key) rethrows where Value == [S.Element], S : Sequence
        /**
         \~chinese:
         创建一个新的 dictionary， 它的键是通过给定的闭包返回的分组，它的值返回每个键的元素的数组
         
         \~english:
         creates a new dictionary whose keys are the groupings returned by the given closure and whose values are arrays of the elements that returned each key.
         */
        
        let students = ["Kofi", "Abena", "Efua", "Kwedu", "Akosua"]
        let studentsByLetter = Dictionary.init(grouping: students, by: { $0.first! })
        print("studentsByLetter is \(studentsByLetter)")
        
        //MARK:public subscript(key: Dictionary.Key) -> Dictionary.Value?
        /**
         \~chinese:
         访问给定的key对应的value，进行读写
         
         \~english:
         accesses the value associated with the given key for reading and writing
         */
        var hues1 = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
        print("hues1 is \(hues1["Coral"]!)")
        hues1["Coral"] = 100
        print("hues1 is \(String(describing: hues1["Cora"]))")
        
        
        //MARK:public var count: Int { get }
        /**
         \~chinese:
         dictionary 中key-vlaue 的数量
         
         \~english:
         the number of key-value pairs in the dictionary
         */
        print("hues1.count is \(hues1.count)")
        
        
        //MARK:public isEmpty: Bool { get }
        /**
         \~chinese:
         Bool值， 表示一个dictionary 是否为空
         
         \~english:
         a Boolean value that indicates whether the dictionary is empty
         */
        
        var frequencies: [String: Int] = [:]
        print("frequencies.isEmpty is \(frequencies.isEmpty)")
        
        
        //MARK:public mutating func updateValue(_ value: Dictionary.Value, forKey key: Dictionary.Key) -> Dictionary.Value?
        /**
         \~chinese:
         根据给定的key， 更新它所在的dictionary中对应的值。如果给定的key不存在的话，就会创建一个新的key-value
         
         \~english:
         updates the value stored in the dictionary for the given key, or adds a new key-value pair if the key does not exist.
         */
        var hues2 = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
        if let oldValue = hues2.updateValue(18, forKey: "newCoral") {
            print("the old value of \(oldValue) was replaced with a new one")
        } else {
            print("no value was found in the dictionary for that key.")
            print("hues2 is \(hues2)")//创建一个新的键值对
        }
        
        //MARK:public mutating func merge<S>(_ other: S, uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value) rethrows where S: Sequence,S.Element == (Key, Value)
        /**
         \~chinese:
         合并给定的序列中的键值对到当前dictionary，使用组合闭包来确定任何重复键对应的值
         
         \~english:
         merges the key-values pairs in the given sequence into the dictionary, using a combining closure to determine the value for any duplicate keys
         */
        var dictionary = ["a": 1, "b": 2]
        
        /* keeping existing value for key "a" */
        dictionary.merge(zip(["a", "c"], [3, 4]), uniquingKeysWith: {(current, _) in current })
        print("dictionary is \(dictionary)")
        
        let dictionary1 = zip(["a", "c"], [3, 4])
        print("dictionary1 is \(dictionary1)")
        
        /* taking the new value for key "a" */
        dictionary.merge(zip(["a", "d"], [5, 6]), uniquingKeysWith: {(_, new) in new })
        print("dictionary is \(dictionary)")
        
        
        
        //MARK:public mutating func merge(_ other: [Dictionary.Key : Dictionary.Value], uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value) rethrows
        /**
         \~chinese:
         合并给定的dictionary 到当前dictionary，使用组合闭包来确定任何重复键对应的值
         
         \~english:
         merges the given dictionary into this dictionary, using a combining closure to determine the value for any duplicate keys.
         */
        
        var anotherDictionary = ["a": 1 , "b": 2]
        anotherDictionary.merge(["a": 3, "b": 2], uniquingKeysWith: { (current, _) in current })
        print("anotherDictionary is \(anotherDictionary)")
        
        
        anotherDictionary.merge(["a": 5, "c": 4], uniquingKeysWith: {(_, new) in new})
        print("anotherDictionary is \(anotherDictionary)")
        
        //MARK:public func merging<S>(_ other: S, uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value) rethrows -> [Dictionary.Key : Dictionary.Value] where S : Sequence, S.Element == (Key, Value)
        
        /**
         \~chinese:
         合并给定的序列中的键值对到dictionary，使用组合闭包来确定任何重复键对应的值
         
         \~english:
         creates a dictionary by merging key-value pairs in a sequence into the dictionary, using a combining closure to determine the value for duplicate keys.
         */
        
        let dictionary2 = ["a": 3, "b": 4]
        let newKeyValues = zip(["c", "d"], [12, 20])

        
        let keepingCurrent = dictionary2.merging(newKeyValues) { (current, _) -> Int in
            current
        }
        print("keepingCurrent is \(keepingCurrent)")
        
        let replacingCurrent = dictionary2.merging(newKeyValues) { (_, new) -> Int in
            new
        }
        print("replacingCurrent is \(replacingCurrent)")
        
        
        //MARK:public func merging(_ other: [Dictionary.Key : Dictionary.Value], uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value)
        /**
         \~chinese:
         通过合并一个给定的dictionary到当前的dictionary中来创建一个新的dictionary， 使用一个组合闭包来确定拥有相同key的value
         
         \~english:
         creates a dictionary by merging the given dictionary into this dictionary, using a combining closure to determine the value for duplicate keys.
         */
        
        let dictionary3 = ["a": 1, "b": 2]
        let otherDictionary = ["a": 3, "b": 4]
        let keeping = dictionary3.merging(otherDictionary) { (current, _) -> Int in
            current
        }
        print("keeping is \(keeping)")
        
        let replacing = dictionary3.merging(otherDictionary) { (_, new) -> Int in
            new
        }
        print("replacing is \(replacing)")
        
        
        //MARK:public mutating func remove(at index: Dictionary<Key, Value>.Index) -> Dictionary.Element
        /**
         \~chinese:
         移除并返回特定位置的key-value
         
         \~english:
         removes and returns the key-value pair at the specified index.
         */
        
        
        //MARK:public mutating func removeValue(forKey key: Dictionary.Key) -> Dictionary.Value?
        /**
         \~chinese:
         从dictionary中移除给定的key和它对应的value
         
         \~english:
         removes the given key and its associated value from the dictionary
         */
        
        var hues3 = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
//        if let value = hues3.removeValue(forKey: "Coral") {
//            print("The value \(value) was removed.")
//            print("hues3 is \(hues3) now")
//        }
        
        //MARK:public mutating func removeAll(keepingCapacity keepCapacity: Bool = default)
        /**
         \~chinese:
         移除dictionary 中所有的key-values
         
         \~english:
         removes all key-value pairs from the dictionary.
         */
        
        
        //MARK:@available(swift 4.0)    public var keys: Dictionary<Key, Value>.Keys { get }
        
        /**
         \~chinese:
         一个仅仅包含一个dictionary的keys 的集合
         
         \~english:
         a collection containing just the keys of the dictionary
         */
        
        let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
        print("countryCodes's all keys is \(countryCodes.keys)")
        
        
        
        
        //MARK:@available(swift 4.0)   public var values: Dictionary<Key, Value>.Values
        /**
         \~chinese:
         一个仅仅包含一个dictionary所有values 的集合
         
         \~english:
         a collection containing just the values of the dictionary.
         */
        
        print("countryCodes's all values is \(countryCodes.values)")
        
        
        //MARK: public mutating func popFirst() -> Dictionary.Element?
        /**
         \~chinese:
         移除并返回第一个key-value对，如果dictionary 不为空的话
         
         \~english:
         removes and returns the first key-value pair of the dictionary if the dictionary isn't empty
         */
        
        
        
        //MARK:public var capacity: Int { get }
        /**
         \~chinese:
         字典的键-值对的总数可以包含没有分配新的存储
         
         \~english:
         the total number of key-value pairs that the dictionary can contain without allocating new storage.
         */
        
        
        //MARK:public mutating func reserveCapacity(_ minimumCapacity: Int)
        /**
         \~chinese:
         开辟足够的空间存储特定数量的key-value对
         
         \~english:
         reserves enough space to store the specified number of key-value pairs.
         */
        
        
        //MARK:public func map<T>(_ transform: ((key: Key, value: Value)) throws -> T) rethrows -> [T]
        
        /* in this example , 'map' is used first to convert the names in the array to lowercase strings and than to count their characters */
        let cast1 = ["Vivien", "Marlon", "Kim", "Karl"]
        let element = cast1.map { $0.lowercased()
        }
        print("element is \(element)")
        
        let anotherElement = cast1.map { $0.count
        }
        print("anotherElement is \(anotherElement)")
        
        
        //MARK:public func sorted(by areInIncreasingOrder: ((key: Key, value: Value), (key: Key, value: Value)) throws -> Bool) rethrows -> [(key: Key, value: Value)]
        
        /**
         \~chinese:
         根据给定的排序规则返回一个排序后的序列
         
         \~english:
         returns the elements of the sequence, sorted using the given predicate as the comparison between elements
         */
        let newhues = hues3.sorted { $0 < $1 }
        print("newhues is \(newhues)")
        
        //MARK:public func map<T>(_ transform: ((key: Key, value: Value)) throws -> T) rethrows -> [T]
        /**
         \~chinese:
         在下面的例子中，map 被用于把dictionary 的keys转换成小写重新组成一个数组返回或者统计每个key的character的个数，重新组成一个数组返回
         
         \~english:
         in this example, 'map' is used first to convert the names in the array to lowercase strings and than to count their characters
         */
        
        
        var source = ["first": 1, "seond": 2, "third": 3, "se": 2]
        let result = source.map { $0.key.lowercased() }
        print("result is \(result)")
        
        let resultKeys = source.map { $0.key }
        print("resultKeys is \(resultKeys)")
        
        let resultValues = source.map { $0.value }
        print("resultValues is \(resultValues)")
        
        let resultKeyCounts = source.map { $0.key.count }
        print("resultKeyCounts is \(resultKeyCounts)")
        
        //MARK:public var indices: DefaultIndices<Dictionary<Key, Value>> { get }
        
        /**
         \~chinese:
         <#comments#>
         
         \~english:
         the indices that are valid for subscripting the collection, in ascending order.
         */
        
        let indic = source.indices
        print("indic is \(indic)")
        
        
        //MARK: public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result
        /**
         \~chinese:
         根据给定的闭包，返回序列dictionary中元素的value相加的总和
         
         \~english:
         retruns the result of combining the elements of the sequence using the given closure
         */
        let sum = source.reduce(0) { (x, y) in
            x + y.value
        }
        print("sum is \(sum)")
        
        //MARK:public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, (key: Key, value: Value)) throws -> ()) rethrows -> Result
        let newSum = source.reduce(into: [:]) { (counts, letter) in
            counts[letter.key, default: 0] += 1
        }
        print("newSum is \(newSum)")
        
        
        //MARK:public func reversed() -> [(key: Key, value: Value)]
        print("source.reversed() is \(source.reversed())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

