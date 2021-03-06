//
//  CalendarViewController.swift
//  SideBarTest
//
//  Created by Alixa Bahena on 2/2/18.
//  Copyright © 2018 Alixa Bahena. All rights reserved.
//

import UIKit
import JTAppleCalendar
import FeedKit
import NVActivityIndicatorView


class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    @IBOutlet weak var noItemsView: UIView!
    let calendar = Calendar.current
    var selectedDate = Date()
    let todaysDate = Date()
    let formatter = DateFormatter()
    
    let otherVC = UIApplication.shared.delegate as! AppDelegate
    var events = [CalendarEvents]()
    var todaysEvents = [CalendarEvents]()

    
    func dayEvents()
    {
        
        todaysEvents = events.filter{calendar.isDate(($0.pubDate as Date), inSameDayAs: selectedDate)}
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        //let size = CGSize(width: 30, height: 30)
        //self.startAnimating(size, message: "Loading Events", type: NVActivityIndicatorType.lineScale )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()

        calendarView.scrollToDate(Date(), animateScroll: false)
        calendarView.selectDates([ Date() ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 45
        tableView.estimatedRowHeight = 45
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundView = noItemsView
        
       
         activityIndicatorView.startAnimating()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
      
        //load data here
        self.events = self.otherVC.events
        self.dayEvents()
        self.tableView.reloadData()
        activityIndicatorView.stopAnimating()

    }

    @objc func loadList(){
        //load data here
        self.events = self.otherVC.events
        self.dayEvents()
        self.tableView.reloadData()
        activityIndicatorView.stopAnimating()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "eventDetail",
            let destination = segue.destination as? EventDetailsViewController,
            let tableIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.name = todaysEvents[tableIndex].title
            //formatter.dateFormat = "EEEE, MMMM d, yyyy h:mm a"
           // let eventDate = formatter.string(from: todaysEvents[tableIndex].pubDate)
            destination.time = todaysEvents[tableIndex].starttime + "-" + todaysEvents[tableIndex].endtime
            destination.desc = todaysEvents[tableIndex].descriptions
            destination.location = todaysEvents[tableIndex].category
            destination.host = todaysEvents[tableIndex].link
            destination.date = todaysEvents[tableIndex].pubDate
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todaysEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        
        
        
        cell.prepareForReuse()

        dayEvents()
        if(todaysEvents.count != 0)
        {
                cell.titleLabel.text = todaysEvents[indexPath.row].title
                formatter.dateFormat = "EEEE, MMMM d, yyyy h:mm a"
                let eventDate = formatter.string(from: todaysEvents[indexPath.row].pubDate)
                cell.dateLabel.text = eventDate
        
        }
        else if(tableView.visibleCells.count == 0)
        {
            
        }
            return cell
        
    }
    
    
    func setupCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.visibleDates { (visibleDates) in
          self.setupViewsOfCalendar(from: visibleDates)
        }
        

    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        
        formatter.dateFormat = "yyyy MM dd"
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        
        if validCell.isSelected {
            validCell.dateLabel.textColor = UIColor.white
        } else {
            if todaysDateString == monthDateString{
                validCell.dateLabel.font = UIFont(name: "Futura-Bold", size: 17)
                validCell.dateLabel.textColor = UIColor(named: "UHDRed")
            } else {
                
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = UIColor.black
            } else {
                validCell.dateLabel.textColor = UIColor(named: "lightGreyText")
                
                
            }
            }
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
            
            
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellEvents(view: JTAppleCell?, cellState: CellState) {
         guard let validCell = view as? CustomCell else { return }
        var dateExist = true
        
        if (events.filter{calendar.isDate(($0.pubDate as Date), inSameDayAs: cellState.date)}.count != 0)
        {
            dateExist = false
        }
        
        validCell.eventDotView.isHidden = dateExist
        
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from: date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension CalendarViewController: JTAppleCalendarViewDataSource {

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2018 12 31")!
        
        let paramaters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return paramaters
    }

}

extension CalendarViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellEvents(view: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        selectedDate = date
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellEvents(view: cell, cellState: cellState)
        cell?.bounce()
        dayEvents()
        tableView.reloadData()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
}

extension UIView {
    func bounce() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 0.5,
            delay: 0, usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.1,
            options: UIViewAnimationOptions.beginFromCurrentState,
            animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}

