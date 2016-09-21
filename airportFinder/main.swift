//
//  main.swift
//  airportFinder
//
//  Created by Jonas Hüsser on 20.09.16.
//  Copyright © 2016 Jonas Hüsser. All rights reserved.
//

import Foundation
import Darwin
var airports: [String : String] = ["TOR": "Toronto", "NY": "New York", "LHR": "London Heathrow","ZRH": "Zurich Airport", "BER" : "This is a joke right?"]


var AirportCode: String
var Result: String

func airportExistsByCode(APC AirportCode: String) -> Bool {
    
    let codeExists = airports[AirportCode] != nil
    
    return codeExists
}



func searchAirportByCode(APC AirportCode: String) -> String {
    
    let codeExists = airportExistsByCode(APC: AirportCode)
    
    if codeExists == true {
        AirportName = airports[AirportCode]!
    } else {
    
        print("Sorry the Airport with Code \(AirportCode) could not be found")
        AirportName = ""
    
    }
 
   
    return AirportName
}



func LookupUI() {
    print("Please Enter the Airport you want to look up: ")
    
    let AirportCode = readLine(strippingNewline: true)!
    
    let Result = searchAirportByCode(APC: AirportCode)
    
    
    print(Result)
    
    main()
}


func addAirportByCode() {
    
    print("Please enter the Code of the Airport:")
    let AirportCode = readLine(strippingNewline: true)!
    print("Please enter the Name / Description of the Airport with the Code \(AirportCode)")
    let AirportName = readLine(strippingNewline: true)!
    airports[AirportCode] = AirportName
    
    let codeExists = airportExistsByCode(APC: AirportCode)
    
    if codeExists == true {
        print("Adding of airport with code \(AirportCode) and name \(AirportName) was successfull")
    } else {
        
        print("Sorry the airport could not be added")
        
    }

main()
    
}

func deleteAirportByCode() {
    
    print("Please enter the code of the airport you want to delete:")
    let AirportCode = readLine(strippingNewline: true)!
    let codeExists = airportExistsByCode(APC: AirportCode)
    
    if codeExists == true {
        let AirportName = airports[AirportCode]!
        print("Are you sure you want to delete the airport \(AirportName) with code \(AirportCode) ? [Y/N]")
        let uac = readLine(strippingNewline: true)!
        
        if uac == "y" {
            airports.removeValue(forKey: AirportCode)
            
            print("Succesfully deleted \(AirportCode) \(AirportName)")
            
            
        } else if uac == "n" {
            print("Airport \(AirportName) with code \(AirportCode) was not deleted")
           
        } else {
            print("\(uac) is not a vailid option.")
            deleteAirportByCode()
        }
        
    } else {
        
        print("Sorry the airport with code \(AirportCode) could not be found. Nothing deleted")
        
    }
    main()
}


func main(){


print("Please select an option [L]ookup Airport, [A]dd new airport, [D]elete airport, [q]uit")
let option = readLine(strippingNewline: true)!

if option == "a" {
    addAirportByCode()
} else if option == "l" {
    
    LookupUI()
} else if option == "d"{
 
    deleteAirportByCode()
    
}

else if option == "q"{
 
    exit(0)
    
} else {
    print("There is no such option \(option)")
    main()
    
    
}
}

var AirportName: String
main()

