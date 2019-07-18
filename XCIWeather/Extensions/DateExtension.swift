//
//  DateExtension.swift
//  XCIWeather
//
//  Created by Dmytro on 6/20/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

extension Date
{
    func toString( dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func truncateDate() -> Date {
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        return Calendar.current.date(from: comp)!
    }
    
    
    func toTimeZone(utcOffset: Int) -> Date
    {
        let utcDate = self.addingTimeInterval(TimeInterval(-TimeZone.current.secondsFromGMT()))
        
        return utcDate.addingTimeInterval(TimeInterval(utcOffset))
    }
}
