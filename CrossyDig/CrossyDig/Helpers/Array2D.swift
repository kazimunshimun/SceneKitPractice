//
//  Array2D.swift
//  CrossyDig
//
//  Created by Anik on 10/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

class Array2D {
    var cols: Int, rows: Int;
    var data: [Int];
    
    init(cols columnCount: Int, rows rowCount: Int, value defaultValue: Int) {
        self.cols = columnCount;
        self.rows = rowCount;
        data = Array(repeating: defaultValue, count: rows * cols);
    }
    
    subscript(column: Int, row: Int) -> Int {
        get {
            return data[cols * row + column];
        }
        set {
            data[cols * row + column] = newValue;
        }
    }
    
    func columnCount() -> Int {
        return self.cols;
    }
    
    func rowCount() -> Int {
        return self.rows;
    }
}
