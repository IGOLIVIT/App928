//
//  HomeViewModel.swift
//  App928
//
//  Created by IGOR on 11/10/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @AppStorage("name1doc") var name1doc: String = ""
    @AppStorage("name2doc") var name2doc: String = ""
    @Published var addName1Doc: String = ""
    @Published var addName2Doc: String = ""
    
    @AppStorage("spec1doc") var spec1doc: String = ""
    @AppStorage("spec2doc") var spec2doc: String = ""
    @Published var addSpec1Doc: String = ""
    @Published var addSpec2Doc: String = ""
    
    @AppStorage("ns1doc") var ns1doc: String = ""
    @AppStorage("ns2doc") var ns2doc: String = ""
    @Published var addNS1Doc: String = ""
    @Published var addNS2Doc: String = ""
    
    @AppStorage("ear1doc") var ear1doc: String = ""
    @AppStorage("ear2doc") var ear2doc: String = ""
    @Published var addEar1Doc: String = ""
    @Published var addEar2Doc: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddTopDocs: Bool = false
    @Published var isAddOtherDoc: Bool = false

    @Published var docName: String = ""
    @Published var docSum: String = ""
    @Published var docServices: String = ""
    @Published var docFunc: String = ""

    @Published var doctors: [DocModel] = []
    @Published var selectedDoc: DocModel?

    func addDoc() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DocModel", into: context) as! DocModel

        loan.docName = docName
        loan.docSum = docSum
        loan.docServices = docServices
        loan.docFunc = docFunc

        CoreDataStack.shared.saveContext()
    }

    func fetchDocs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DocModel>(entityName: "DocModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.doctors = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.doctors = []
        }
    }
}
