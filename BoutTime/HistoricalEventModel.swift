//
//  EventModel.swift
//  BoutTime
//
//  Created by Nuno Trindade on 05/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import Foundation

struct HistoricalEventModel {
    
    let staticHistoricalEvents: [HistoricalEvent] =
        [
            HistoricalEvent(text: "Winter Olympics held in Salt Lake City, Utah, United States.", year: 2002, month: .february, urlString: "http://en.wikipedia.org/wiki/2002_Winter_Olympics"),
            HistoricalEvent(text: "Summer Olympics held in Athens, Greece.", year: 2004, month: .august, urlString: "http://en.wikipedia.org/wiki/2004_Summer_Olympics"),
            HistoricalEvent(text: "UEFA Euro Cup held in Portugal and won by Greece.", year: 2004, month: .june, urlString: "http://en.wikipedia.org/wiki/UEFA_Euro_2004"),
            HistoricalEvent(text: "Winter Olympics held in Turin, Italy.", year: 2006, month: .february, urlString: "http://en.wikipedia.org/wiki/2006_Winter_Olympics"),
            HistoricalEvent(text: "Summer Olympics held in Beijing, China.", year: 2008, month: .august, urlString: "http://en.wikipedia.org/wiki/2008_Summer_Olympics"),
            HistoricalEvent(text: "FIFA World Cup held in South Africa and won by Spain", year: 2010, month: .june, urlString: "http://en.wikipedia.org/wiki/2010_FIFA_World_Cup"),
            HistoricalEvent(text: "Summer Olympics held in London, United Kingdom.", year: 2012, month: .august, urlString: "http://en.wikipedia.org/wiki/2012_Summer_Olympics"),
            HistoricalEvent(text: "Summer Olympics held in Rio de Janeiro, Brazil", year: 2016, month: .august, urlString: "http://en.wikipedia.org/wiki/2016_Summer_Olympics"),
            HistoricalEvent(text: "Winter Olympics held in Sochi, Russia", year: 2014, month: .february, urlString: "https://en.wikipedia.org/wiki/2014_Winter_Olympics"),
            HistoricalEvent(text: "UEFA Euro Cup held in Austria & Switzerland and won by Spain.", year: 2008, month: .june, urlString: "http://en.wikipedia.org/wiki/UEFA_Euro_2008"),
            HistoricalEvent(text: "UEFA Euro Cup held in Poland & Ukraine and won by Spain", year: 2012, month: .june, urlString: "http://en.wikipedia.org/wiki/UEFA_Euro_2012"),
            HistoricalEvent(text: "Copa América held in Argentina and won by Uruguay", year: 2011, month: .july, urlString: "http://en.wikipedia.org/wiki/2011_Copa_Am%C3%A9rica"),
            HistoricalEvent(text: "UEFA Euro Cup held in France and won by Portugal", year: 2016, month: .june, urlString: "http://en.wikipedia.org/wiki/UEFA_Euro_2016"),
            HistoricalEvent(text: "Winter Olympics held in Vancouver, British Columbia, Canada", year: 2010, month: .february, urlString: "http://en.wikipedia.org/wiki/2010_Winter_Olympics"),
            HistoricalEvent(text: "Winter Olympics held in Sochi, Russia", year: 2014, month: .february, urlString: "http://en.wikipedia.org/wiki/2014_Winter_Olympics"),
            HistoricalEvent(text: "Copa América held in Peru and won by Brazil", year: 2004, month: .july, urlString: "http://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica"),
            HistoricalEvent(text: "Copa América held in Venezuela and won by Brazil", year: 2007, month: .july, urlString: "http://en.wikipedia.org/wiki/2007_Copa_Am%C3%A9rica"),
            HistoricalEvent(text: "Copa América held in Chile and won by Chile", year: 2015, month: .july, urlString: "http://en.wikipedia.org/wiki/2015_Copa_Am%C3%A9rica"),
            HistoricalEvent(text: "FIFA World Cup held in Brazil and won by Germany", year: 2014, month: .june, urlString: "http://en.wikipedia.org/wiki/2014_FIFA_World_Cup"),
            HistoricalEvent(text: "Super bowl: The Rams defeated the Titans 23–16 at Georgia Dome in Atlanta", year: 2000, month: .january, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXIV"),
            HistoricalEvent(text: "Super bowl: The Ravens defeated the Giants 34–7 at Raymond James Stadium in Tampa, Florida", year: 2001, month: .january, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXV"),
            HistoricalEvent(text: "Super bowl: Denver Broncos defeated Carolina Panthers 24–10 at Superdome, New Orleans", year: 2002, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXVI"),
            HistoricalEvent(text: "Super bowl: The Buccaneers defeated the Raiders 48–21 at Qualcomm Stadium, San Diego", year: 2003, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXVII"),
            HistoricalEvent(text: "Super bowl: The Patriots defeated the Panthers 32–29 at Reliant Stadium, Houston", year: 2004, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXVIII"),
            HistoricalEvent(text: "Super bowl: The Patriots defeated the Eagles 24–21 at Alltel Stadium, Jacksonville, Florida", year: 2005, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XXXIX"),
            HistoricalEvent(text: "Super bowl: The Steelers defeated the Seahawks 21–10 at Ford Field, Detroit", year: 2006, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XL"),
            HistoricalEvent(text: "Super bowl: The Colts defeated the Bears 29–17 at Dolphin Stadium, Miami Gardens, Florida", year: 2007, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLI"),
            HistoricalEvent(text: "Super bowl: The Giants defeated the Patriots 17–14 at University of Phoenix Stadium, Glendale, Arizona", year: 2008, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLII"),
            HistoricalEvent(text: "Super bowl: The Steelers defeated the Cardinals 27–23 at Raymond James Stadium, Tampa, Florida", year: 2009, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLIII"),
            HistoricalEvent(text: "Super bowl: The Saints defeated the Colts 31–17 at Sun Life Stadium, Miami Gardens", year: 2010, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLIV"),
            HistoricalEvent(text: "Super bowl: The Packers defeated the Steelers 31–25 at Cowboys Stadium, Arlington, Texas", year: 2011, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLV"),
            HistoricalEvent(text: "Super bowl: The Giants defeated the Patriots 21–17 at Lucas Oil Stadium, Indianapolis", year: 2012, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLVI"),
            HistoricalEvent(text: "Super bowl: The Ravens defeated the 49ers 34–31 at Mercedes-Benz Superdome, New Orleans", year: 2013, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLVII"),
            HistoricalEvent(text: "Super bowl: The Seahawks defeated the Broncos 43–8 at MetLife Stadium, East Rutherford, New Jersey", year: 2014, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLVIII"),
            HistoricalEvent(text: "Super bowl: The New England Patriots defeated the Seahawks 28–24 at University of Phoenix Stadium, Glendale, Arizona", year: 2015, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_XLVIX"),
            HistoricalEvent(text: "Super bowl: The Denver Broncos defeated the Carolina Panthers 24–10 at Levi's Stadium, Santa Clara, California", year: 2016, month: .february, urlString: "http://en.wikipedia.org/wiki/Super_Bowl_50"),
            HistoricalEvent(text: "Stanley Cup: New Jersey Devils defeated the Dallas Stars 4-2", year: 2000, month: .may, urlString: "http://en.wikipedia.org/wiki/2000_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Colorado Avalanche defeated the New Jersey Devils 4-3", year: 2001, month: .may, urlString: "http://en.wikipedia.org/wiki/2001_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Detroit Red Wings defeated the Carolina Hurricanes 4-1", year: 2002, month: .june, urlString: "http://en.wikipedia.org/wiki/2002_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: New Jersey Devils defeated the Mighty Ducks of Anaheim 4-3", year: 2003, month: .may, urlString: "http://en.wikipedia.org/wiki/2003_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Tampa Bay Lightning defeated the Calgary Flames 4-3", year: 2004, month: .may, urlString: "http://en.wikipedia.org/wiki/2004_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Season Cancelled due to Lockout", year: 2005, month: .may, urlString: "http://en.wikipedia.org/wiki/2005_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Carolina Hurricanes defeated the Edmonton Oilers 4-3", year: 2006, month: .june, urlString: "http://en.wikipedia.org/wiki/2006_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Anaheim Ducks defeated the Ottawa Senators 4-1", year: 2007, month: .may, urlString: "http://en.wikipedia.org/wiki/2007_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Detroit Red Wings defeated the Pittsburgh Penguins 4-2", year: 2008, month: .may, urlString: "http://en.wikipedia.org/wiki/2008_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Pittsburgh Penguins defeated the Detroit Red Wings 4-3", year: 2009, month: .may, urlString: "http://en.wikipedia.org/wiki/2009_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Chicago Blackhawks defeated the Philadelphia Flyers 4-2", year: 2010, month: .may, urlString: "http://en.wikipedia.org/wiki/2010_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Boston Bruins defeated the Vancouver Canucks 4-3", year: 2011, month: .june, urlString: "http://en.wikipedia.org/wiki/2011_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Los Angeles Kings defeated the New Jersey Devils 4-2", year: 2012, month: .may, urlString: "http://en.wikipedia.org/wiki/2012_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Chicago Blackhawks defeated the Boston Bruins 4-2", year: 2013, month: .june, urlString: "http://en.wikipedia.org/wiki/2013_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Los Angeles Kings defeated the New York Rangers 4-1", year: 2014, month: .june, urlString: "http://en.wikipedia.org/wiki/2014_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Chicago Blackhawks defeated the Tampa Bay Lightning 4-2", year: 2015, month: .june, urlString: "http://en.wikipedia.org/wiki/2015_Stanley_Cup_Finals"),
            HistoricalEvent(text: "Stanley Cup: Pittsburgh Penguins defeated the San Jose Sharks 4-2", year: 2016, month: .may, urlString: "http://en.wikipedia.org/wiki/2016_Stanley_Cup_Finals"),
            HistoricalEvent(text: "FIFA Club World Cup: Internacional defeated Barcelona 1-0 at International Stadium Yokohama, Japan", year: 2006, month: .december, urlString: "http://en.wikipedia.org/wiki/2006_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Milan defeated Boca Juniors 4-2 at Nissan Stadium Yokohama, Japan", year: 2007, month: .december, urlString: "http://en.wikipedia.org/wiki/2007_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Manchester United defeated LDU Quito 1-0 at International Stadium Yokohama, Japan", year: 2008, month: .december, urlString: "http://en.wikipedia.org/wiki/2008_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Barcelona defeated Estudiantes 2-1 at Zayed Sports City, Abu Dhabi", year: 2009, month: .december, urlString: "http://en.wikipedia.org/wiki/2009_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Internazionale Milan defeated TP Mazembe 3-0 at Zayed Sports City, Abu Dhabi", year: 2010, month: .december, urlString: "http://en.wikipedia.org/wiki/2010_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Barcelona defeated Santos 4-0 at International Stadium Yokohama, Japan", year: 2011, month: .december, urlString: "http://en.wikipedia.org/wiki/2011_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Corinthians defeated Chelsea 1-0 at International Stadium Yokohama, Japan", year: 2012, month: .december, urlString: "http://en.wikipedia.org/wiki/2012_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Bayern Munich defeated Raja Casablanca 2-0 at Stade de Marrakech, Marocco", year: 2013, month: .december, urlString: "http://en.wikipedia.org/wiki/2013_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Real Madrid defeated San Lorenzo 2-0 at Stade de Marrakech, Marocco", year: 2014, month: .december, urlString: "http://en.wikipedia.org/wiki/2014_FIFA_Club_World_Cup_Final"),
            HistoricalEvent(text: "FIFA Club World Cup: Barcelona defeated River Plate 3-0 at International Stadium Yokohama, Japan", year: 2015, month: .december, urlString: "http://en.wikipedia.org/wiki/2015_FIFA_Club_World_Cup_Final"),
        ]
    
    func getHistoricalEvents(_ numberOfHistoricalEvents: Int) -> [HistoricalEvent] {
        return getHistoricalEvents(numberOfHistoricalEvents, historicalEvents: staticHistoricalEvents)
    }
    
    func getHistoricalEvents(_ numberOfHistoricalEvents: Int, historicalEvents: [HistoricalEvent]) -> [HistoricalEvent] {
        var localHistoricalEvents: [HistoricalEvent] = []
        var indexesAlreadyPicked: [Int] = []
        
        for index in 1...numberOfHistoricalEvents {
            
            let randomIndex: Int = RandomNumber.getWithUpperBoundAndRestrictions(upperBound: numberOfHistoricalEvents, restrictions: indexesAlreadyPicked)
            indexesAlreadyPicked.append(randomIndex)
            let historicalEvent = historicalEvents[randomIndex]
            historicalEvent.currentPosition = index - 1
            localHistoricalEvents.append(historicalEvent)
        }
        
        return localHistoricalEvents
    }
    
    func sortHistoricalEvents(_ historicalEvents: [HistoricalEvent]) -> [HistoricalEvent] {
        
        var historicalEventsSorted = historicalEvents.sorted { historicalEvent1, historicalEvent2 in
            if historicalEvent1.year == historicalEvent2.year {
                return historicalEvent1.month.rawValue < historicalEvent2.month.rawValue
            }
            return historicalEvent1.year < historicalEvent2.year
        }
        
        var index = 0
        for _ in historicalEventsSorted {
            historicalEventsSorted[index].correctPosition = index
            index += 1
        }
        
        return historicalEventsSorted
    }
    
    func resetHistoricalEvents(_ historicalEvents:[HistoricalEvent]) -> [HistoricalEvent] {
        var historicalEventsSorted = historicalEvents.sorted { historicalEvent1, historicalEvent2 in
            return historicalEvent1.currentPosition < historicalEvent2.currentPosition
        }
        
        var index = 0
        for _ in historicalEventsSorted {
            historicalEventsSorted[index].currentPosition = index
            index += 1
        }
        
        return historicalEventsSorted
    }
}
