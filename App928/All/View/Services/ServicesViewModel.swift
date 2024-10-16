//
//  ServicesViewModel.swift
//  App928
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI
import CoreData

final class ServicesViewModel: ObservableObject {
    
    @Published var docPhotos: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    @Published var currentPhoto: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var servPhoto: String = ""
    @Published var servName: String = ""
    @Published var servSpec: String = ""
    @Published var servLen: String = ""
    @Published var servServ1: String = ""
    @Published var servServ2: String = ""
    @Published var servPrice1: String = ""
    @Published var servPrice2: String = ""

    @Published var services: [ServModel] = []
    @Published var selectedServ: ServModel?

    func addServ() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ServModel", into: context) as! ServModel

        loan.servPhoto = servPhoto
        loan.servName = servName
        loan.servSpec = servSpec
        loan.servLen = servLen
        loan.servServ1 = servServ1
        loan.servServ2 = servServ2
        loan.servPrice1 = servPrice1
        loan.servPrice2 = servPrice2

        CoreDataStack.shared.saveContext()
    }

    func fetchServs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ServModel>(entityName: "ServModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.services = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.services = []
        }
    }
}
