//
//  Main.swift
//
//  Created by Zak Goneau
//  Created on 2025-05-20
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This is the main file for the student class program

// Import library
import Foundation

// Define main function
func main(){
    // Declare file
    let inputFile = "input.txt"
    let outputFile = "output.txt"

    // Declare list
    var studentList: [Student] = []

    // Read from input file
    var fileLines: [String] = []
    do {
        let fileContents = try String(contentsOfFile: inputFile, encoding: .utf8)
        fileLines = fileContents.components(separatedBy: "\n")
    
    // Tell user if it couldn't read from file
    } catch {
        print("Couldn't read the file")
        // Exit program
        exit(1)
    }

    // Process each line
    var lineIndex = 0

    // Initialize counter
    var counter = 0

    // Loop while there are lines to process
    while lineIndex < fileLines.count {
        // Increment counter
        counter += 1

        // Trim the line to remove whitespace and newlines
        let line = fileLines[lineIndex].trimmingCharacters(in: .whitespacesAndNewlines)

        // Split the line into strings by spaces
        let lineString = line.components(separatedBy: " ")

        // Create student instance
        var student: Student

        // Check if parts length is 5
        if lineString.count == 5 {
            // Create student with middle initial
            student = Student(name: lineString[0], middleInitial: lineString[1], lastName: lineString[2], grade: lineString[3], iep: lineString[4])

            // Add student to list
            studentList.append(student)

            // Print student information
            student.printData()

            // Print new line
            print("")

        // Otherwise no middle initial
        } else {
            // Create student without middle initial
            student = Student(name: lineString[0], lastName: lineString[1], grade: lineString[2], iep: lineString[3])

            // Add student to list
            studentList.append(student)

            // Print student information
            student.printData()

            // Print new line
            print("")
        }
        // Increment line index
        lineIndex += 1
    }
    // Get number of indexes of list
    let numberOfIndexes = studentList.count

    // Write number of students to file
    do {
        // Create file handle

        // Write number of students to output file
        try "There are \(numberOfIndexes) students\n".write(toFile: outputFile, atomically: true, encoding: .utf8)

    // Catch errors and tell user
    } catch {
        print("Couldn't write to the file")

        // Exit program
        exit(1)
    }



    // Print success message
    print("Successfully written to file.")

}

//
//  Student.swift
//
//  Created by Zak Goneau
//  Created on 2025-05-20
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This is the student class for the student program

// Import library
import Foundation

// Define student class
class Student {
    // Declare attributes
    var name:String
    var middleInitial:String
    var lastName:String
    var grade:String
    var iep:String

    // Constructor for student with middle initial
    init(name: String, middleInitial: String, lastName: String, grade: String, iep: String) {
        // Set default values
        self.name = name
        self.middleInitial = middleInitial
        self.lastName = lastName
        self.grade = grade
        self.iep = iep
    }
    
    // Constructor for student without middle initial
    init(name: String, lastName: String, grade: String, iep: String) {
        // Set default values
        self.name = name
        self.middleInitial = ""
        self.lastName = lastName
        self.grade = grade
        self.iep = iep
    }

    // Method to print student information
    func printData() {
        // Print student information
        print("Name: \(name) \(middleInitial) \(lastName)")
        print("Grade: \(grade)")
        print("IEP: \(iep)")
    }

}

// Call main
main()