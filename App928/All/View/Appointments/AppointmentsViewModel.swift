//
//  AppointmentsViewModel.swift
//  App928
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI
import CoreData

final class AppointmentsViewModel: ObservableObject {
    
    @Published var docPhotos: [String] = ["d1", "d2", "d3", "d4", "d5",]
    @Published var currentPhoto: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var apPhoto: String = ""
    @Published var apDName: String = ""
    @Published var apDSpec: String = ""
    @Published var apPName1: String = ""
    @Published var apServ1: String = ""
    @Published var apPrice1: String = ""
    @Published var apDate1: Date = Date()
    @Published var apTime1: Date = Date()
    @Published var apPName2: String = ""
    @Published var apServ2: String = ""
    @Published var apPrice2: String = ""
    @Published var apDate2: Date = Date()
    @Published var apTime2: Date = Date()

    @Published var appointments: [AppModel] = []
    @Published var selectedApp: AppModel?

    func addApp() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AppModel", into: context) as! AppModel

        loan.apPhoto = apPhoto
        loan.apDName = apDName
        loan.apDSpec = apDSpec
        loan.apPName1 = apPName1
        loan.apServ1 = apServ1
        loan.apPrice1 = apPrice1
        loan.apDate1 = apDate1
        loan.apTime1 = apTime1
        loan.apPName2 = apPName2
        loan.apServ2 = apServ2
        loan.apPrice2 = apPrice2
        loan.apDate2 = apDate2
        loan.apTime2 = apTime2

        CoreDataStack.shared.saveContext()
    }

    func fetchApps() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AppModel>(entityName: "AppModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.appointments = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.appointments = []
        }
    }
}
