//
//  AllTheGuides.swift
//  final-project
//
//  Created by Hayden  Greer on 7/25/17.
//  Copyright © 2017 Hayden Greer. All rights reserved.
//

import Foundation
import MapKit

protocol AllTheGuidesModelListenerProtocol {
    func itemsChanged() -> Void
}

class TravelGuide: NSObject, NSCoding, MKAnnotation {
    var title: String? // This is the name of the city
    var coordinate: CLLocationCoordinate2D
    var lat: Double?
    var lon: Double?
    
    var tripTitle: String // This is the name of the trip
    var startDate: String
    var endDate: String
    var tripOverview: String // This is actually the html code diguised as a string
    
    init(title: String, coordinate: CLLocationCoordinate2D, tripTitle: String, startDate: String, endDate: String, tripOverview: String) {
        
        self.title = title
        self.coordinate = coordinate
        self.lat = coordinate.latitude
        self.lon = coordinate.longitude
        
        self.tripTitle = tripTitle
        self.startDate = startDate
        self.endDate = endDate
        self.tripOverview = tripOverview
        
        super.init()
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let title = aDecoder.decodeObject(forKey: "title") as? String,
            let lat = aDecoder.decodeObject(forKey: "lat") as? Double,
            let lon = aDecoder.decodeObject(forKey: "lon") as? Double,
     
            let tripTitle = aDecoder.decodeObject(forKey: "tripTitle") as? String,
            let startDate = aDecoder.decodeObject(forKey: "startDate") as? String,
            let endDate = aDecoder.decodeObject(forKey: "endDate") as? String,
            let tripOverview = aDecoder.decodeObject(forKey: "tripOverview") as? String
                else { return nil }
        
        self.init (
            title: title,
            coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon),
            tripTitle: tripTitle,
            startDate: startDate,
            endDate: endDate,
            tripOverview: tripOverview
        )
        
        
    }
    
    // MARK: NSCoding protocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(lon, forKey: "lon")
        aCoder.encode(tripTitle, forKey: "tripTitle")
        aCoder.encode(startDate, forKey: "startDate")
        aCoder.encode(endDate, forKey: "endDate")
        aCoder.encode(tripOverview, forKey: "tripOverview")
    }
    
        
}

// My global model
var globalModel = AllTheGuides(guideModel: [
    
    TravelGuide(title: "Boston, USA", coordinate: CLLocationCoordinate2D(latitude: 42.364506, longitude: -71.038887), tripTitle: "Summer Internship", startDate: "6/19/17", endDate: "8/04/17", tripOverview: "<p style='padding-left: 80px;'><strong><u>Boston Guide</u></strong></p><p><strong><u>&nbsp;</u></strong></p><p><strong>Summary </strong></p><p>I made this document so I could remember some of the amazing places and things I did in Boston but also give recommendations to people. My guide doesn&rsquo;t consist of everything single thing you can do in the city, but what I did and my main recommendations. I only had around 2 &frac12; months in Boston and wanted to spend my time wisely and have a general plan of things I wanted to do while there. That being said &ndash; some of the best experiences I had in Boston (and also travelling outside of it) we&rsquo;re not planned. Have a general plan and be smart with your time but also be SPONTANEOUS&hellip;some of the best experiences I had were the little things you just stumble upon. It is so much fun finding hidden treasures and having random/unplanned days. These are the days that you really really remember and learn so much about yourself. Boston really is such a fun and young city so take advantage of the melting pot of people and also the city as a whole. Meet the people, try everything, and walk around for hours. Boston really has such character that I have yet to find anywhere else.</p><p>&nbsp;</p><p><strong>Key Lessons</strong></p><ul><li><u>STEP OUT of your comfort zone</u>- I moved to Boston knowing one person and lived with completely random girls I found on a sublease page and it was the best decision I could of done. It is important to branch out and MEET OTHER PEOPLE.</li><li><u>CHERISH the beauty of living a new city</u>- make sure you appreciate every second of living in a completely different city. Take a step back and take it in- it goes by way too fast</li><li><u>Learn the PEOPLE</u> &ndash; people in the east coast can be different. Make sure you take the time to learn the people. Also people from Boston have a HUGE amount of pride. Make sure you immerse yourself in that</li><li><u>Get LOST on purpose</u> &ndash; this how you stumble upon the hidden gems</li><li><u>Enjoy the JOURNEY not the destination</u> - I met the most incredible people literally on transportation. Remember the best things about some of the places you&rsquo;ll be going happens in route</li></ul><p>&nbsp;</p><p><strong>Sights/ Things to do </strong></p><ul><li><u>Top of the Hub/ Prudential Center</u> &ndash; 360 view of the whole city<ul><li>Skywalk observatory &ndash; view of entire city, 19 dollars entrance, closes at 10pm: http://www.prudentialcenter.com/shop_detail.html?id=64</li><li>Top of the Hub-Restaurant - 52<sup>nd</sup> floor, expensive, good for a drink</li></ul></li><li><u>Boston Common</u> &ndash; walk/run/chill here, free workout classes (Boston power hour), swan boat tours</li><li><u>Faneuil Hall/ Quincy Market</u> - big building located in downtown Boston near the bay area. Bunch of street performers, restaurants, dank snacks, and shops. Try the cookiesJ</li><li><u>Boston Aquarium&nbsp;</u>&ndash; by the bay</li><li><u>Freedom Trail</u> &ndash; walk it! Historical sites throughout Boston</li><li><u>Charles River/ Esplanade</u> &ndash; go kayaking or canoeing, sit on the dock and read, have a picnic, work out in the park along the river, really good running routes around it, separates city from Cambridge</li><li><u>Hatch shell</u> &ndash; in the esplanade, a lot of free concerts/events here, free workout classes outside</li><li><u>China Town</u> - right by south station. So take the T (short for the train/ subway) to South Station and get off. You will walk out and should see an Asian garden around the corner. From there, head north and you will see the entrance to China Town</li><li><u>The North End-</u> &ldquo;Italian district&rdquo; of Boston, a lot of really great restaurants and street festivals that happen around it, (also right by Paul Reveres house)</li><li><u>Fenway Park &ndash;</u> Attend a red sox game! MUST DO for the experience, atmosphere is like no other, tickets are pretty cheap</li><li><u>Back Bay-</u> absolutely obsessed with this area in Boston, walk around it</li><li><u>South End &ndash;</u> also love this area, would walk home down Tremont street which has a bunch of great restaurants</li><li><u>Fenway game &ndash;</u> must attend at least one game, such a cool experience</li><li><u>Newbury Street &ndash;</u> main shopping street of Boston, they say the shops get more expensive the further you walk down the street lol (starting at Boston Common). Fav stores = have a really swag nike store, brandy Melville, and H&amp;M</li><li><u>Commonwealth street-</u> has the most beautiful brownstones, most expensive street in Boston (Tom Brady used to live here)</li><li><u>Boylston street-</u> really cool street, a lot of sports bars and great restaurants/ shops, (this is where the Boston Marathon bombing happened)</li><li><u>Bunker Hill -</u> historical monument</li><li><u>Cambridge/ Harvard</u> &ndash; get off at the red line and explore Harvard square, hella cute restaurants and bars</li><li><u>Museum of Fine Arts &ndash;</u> really cool museum</li></ul><p>&nbsp;</p><p><strong>Transportation </strong></p><ul><li>Can walk literally anywhere, city is easy to learn! If you want to learn it fast, WALK it</li><li><u>5 subway lines</u> - super easy to navigate (not like new York), buy a Charlie ticket to save money and call it the &ldquo;T&rdquo; &ndash; they do not call it the subway in Boston. Download boston subway map</li><li><u>South station</u> &ndash; central train station, can take a train literally anywhere..also met so many people on these trains.. for example , I met Yale MBA students, a millionaire who has traveled the world/ started 3 successful businesses, and foreign exchange students from Pakistan&hellip;talk to people. The city is so diverse and full of such interesting people.</li></ul><p><strong>&nbsp;</strong></p><p><strong>Restaurants</strong></p><ul><li><u>Sweet Green-</u> Boylston Street, soo good, super healthy</li><li><u>Lolitas-</u> awesome Mexican food, near northeastern</li><li><u>Legal sea foods-</u> near the harbor (really good lobster rolls). TRY THE LOBSTER ROLL AND CLAM CHOWDER</li><li><u>Ornicos-</u> South End</li><li><u>Cafeteria-</u> Newbury St, good brunch</li><li><u>Met Bar-</u> Newbury St, go for happy hour and good food</li><li><u>Regina&nbsp;Pizzeria</u></li><li><u>Giacomo-</u> North End, such good Italian food, went here when parents visited</li><li><u>O ya </u></li><li><u>Tremont 647-</u> Tremont St (ask for their poptart of the week)</li><li><u>Beehive-</u> South end, jazz, dinner, (get the duck)</li><li><u>Gaslight </u></li><li><u>Sport and Tello</u> &ndash; seaport</li><li><u>Trident </u>&ndash; Newbury St.</li><li><u>Nerro Caf&eacute;-</u> Tremont St.</li><li><u>Alden Harrow-</u> dank brunch, Cambridge</li><li><u>Legal Harbor side-</u> good views, seafood</li><li><u>Tres Gato</u> &ndash; tapas</li><li><u>Stephanie&rsquo;s on Newbury-</u> brunch, sit outside</li><li><u>Neptune oyster-</u> seafood</li><li><u>Jacob Wirth restaurant &ndash;</u> one of the oldest restaurant in Boston, been open for over 200 years</li><li><u>Atlantic Fish &amp; Company &ndash;</u> we balled out here when my parents came to visit, some of the dankest seafood, try the mussels and lobster roll!</li><li><u>Tias &ndash;</u> seafood, waterfront</li><li><u>The maiden </u></li></ul><p>&nbsp;</p><p><strong>Roof Tops </strong></p><ul><li><u>Rooftop Pool at the Colonnade</u> - obsessed with the top of this hotel, pool and bar, incredible views of the city, check the days of when it&rsquo;s free but usually have to pay&hellip;worth it though</li><li><u>Rooftop Revere </u></li><li><u>Envoy &ndash;</u> rooftop bar, went at night, can see whole city lit up</li></ul><p>&nbsp;</p><p><strong>Bars/ Clubs </strong></p><ul><li>Clubs:<ul><li><u>Venue </u></li><li><u>Icon</u></li><li><u>Biju</u></li><li><u>Whisky Sigon</u></li><li><u>Royale</u></li></ul></li><li>Bars<ul><li><u>Howl at the moon</u>- fun on Thursdays</li><li><u>Cask N&rsquo; Flagon-</u> near Fenway</li><li><u>Bills Bar-</u> near Fenway</li><li><u>Loretta&rsquo;s Last Call-</u> near Fenway</li><li><u>The Landing-</u> on the harbor &amp; outside, go for happy hour after work, hella young professionals, this was my favorite bar.. amazing atmosphere</li><li><u>Yard House</u> &ndash; good sports bar to watch a game</li><li><u>Tavern in the Square (TITS) </u>&ndash; went to one in Cambridge, one in Allston is better</li></ul></li></ul><p>&nbsp;</p><p><strong>Weekend Trips </strong></p><ul><li><u>Cape Cod-</u> Chatham (MUST go for 4<sup>th</sup> of July, can take bus to the cape, so many young people, go to the bar called the Squire).</li><li><u>Spectacle Island</u> - ferry ride away, they sell tickets to it right by the harbor at a stand, isolated beach, only spend a few hours there</li><li><u>Carson Beach</u> &ndash; beach in Boston area</li><li><u>Montauk Hamptons </u></li><li><u>New Hampshire &ndash;</u> White Mountain National Forest<ul><li><a href='http://www.nationalgeographic.com/adventure/trips/best-trails/worlds-best-hikes-dream-trails/'>http://www.nationalgeographic.com/adventure/trips/best-trails/worlds-best-hikes-dream-trails/</a></li><li>only a few hour drive away. camped out and did this hike with a friend. MUST DO &ndash; rated top 20 hikes by national geographic!!</li></ul></li><li><u>Vermont </u>&ndash; Green Mountain National Forest<ul><li>Also beautiful place to hike, had to pick one so we picked White mountain but Vermont is supposed to be incredible</li></ul></li><li><u>Newport, Rhode Island</u></li><li><u>Pennsylvania &ndash;</u> visited here b/c my roommate is from there, very pretty but not too much to do</li><li><u>Canada-</u> only a 4 hour drive away, make sure you bring your passport!, never got to do this but really wanted too</li></ul><p>&nbsp;</p><p><strong>NEW YORK- Weekend Trips continued.. </strong></p><ul><li>New York, New York ..(so good they named it twice:) &ndash; just a 3 hr train ride away. HMU if you want even more suggestions these are just my top..<ul><li>Sights/ Things to do:<ul><li><u>Times Square</u> (don't do more than 10-15 minutes there)</li><li><u>Top of the Rock</u> &ndash; better view than empire state building in my opinion</li><li><u>High line</u> - abandoned railroad track turned park that runs parallel to the Hudson. Really cool to walk and has cool scene with great restaurants</li><li><u>Union Square</u> (shopping, restaurant, university area)</li><li><u>Central Park</u> &ndash; walk around it, so much stuff going on in summer</li><li><u>Explore SOHO</u> &ndash; coolest area, bunch of shops&amp; thrift shops (go to Metropolis- Lana del Rey shops here, got a vintage blue jean jacket from here and they have super cool jerseys etc.</li></ul></li><li>Clubs<ul><li><u>Gansevoort-</u> rooftop club on top of hotel, so much fun, be aware very expensive, go to the one in meatpacking district</li><li><u>Avenue - </u>get a table or know a promoter, can be hard to get into as a guy</li><li><u>Tao</u></li><li><u>Purple -</u> good rooftop</li><li><u>Hotel Jane</u> &ndash; club inside a hotel, so cool- very boojie/exclusive vibe</li></ul></li><li>Food:<ul><li><u>The Smith</u> &ndash; brunch</li><li><u>Street hot dogs</u> LOL</li></ul></li></ul></li></ul><p>&nbsp;</p><p><strong>Festivals </strong></p><ul><li><u>Governors Ball New York:</u> June</li><li><u>Lollapalooza:</u> July &ndash; Chicago music festival, best I&rsquo;ve ever been too</li><li><u>Boston Boat Cruise Summer Series</u> &ndash; ALL summer long, concerts on a boat that takes off from the Boston harbor, had some of my most fun nights here, have different artists every week.<ul><li>DO THIS: <a href='http://www.boatcruisesummerseries.com/'>http://www.boatcruisesummerseries.com/</a></li><li>Follow Instagram for artists announcements: boatcruisesummerseries</li></ul></li></ul><p>&nbsp;</p><p><strong>Miscellaneous Things to do </strong></p><ul><li>Sailing Esplanade</li><li>Learn how to surf</li><li>Attend a Fenway Game - MUST</li><li>North End Street Parties</li><li>Join a summer league / intramural team</li><li>Booze cruises</li><li>Outdoor Restaurants</li><li>Outdoor Movies</li><li>Rooftop pools</li><li>Road trips / Camping</li></ul><p>&nbsp;</p><p><strong>Things to Remember </strong></p><ul><li>92 colleges in the greater Boston area &ndash; one of the most diverse and YOUNG cities. So many students and young professionals<ul><li>If you are under 21, be VERY CAREFUL. They are SUPER strict on ID&rsquo;s</li></ul></li><li>Boston is actually a pretty small city, you get to know it very easily and really fast. Highly suggest walking it as much as you can to learn it. It also has such a community/small town feeling to me which I loved. Overall, it has a ton of character and charm.</li><li>One of the most FIT cities in America. Over the summer you see people constantly outdoors enjoying the weather/working out. Each week I&rsquo;d google Boston magazine health/fitness section for the week which would have free workout classes around the city. Take advantage of those!<ul><li>Free: <a href='http://www.bostonmagazine.com/tag/free-fitness/'>http://www.bostonmagazine.com/tag/free-fitness/</a><ul><li>Power hour &ndash; workout class in Boston Common every Wednesday. I know the girls who run it &amp; follow their accounts so hmu if you want their info</li><li>Running clubs &ndash; looked into these but never did one, but there are a ton..</li></ul></li><li>Not free:<ul><li>305 fitness &ndash; straight cardio/dance for 45 min, have a DJ!, doesn&rsquo;t even feel like you&rsquo;re working out, super fun instructors</li><li>YogaWorks Back Bay &ndash; did hip hop yoga here once a week and loved it, its basically vinyasa yoga but with more upbeat songs, also have a variety of other classes</li></ul></li><li>So people always use New England and Boston interchangeable &amp; I was always confused. New England includes: Massachusetts, Connecticut, Maine, New Hampshire, Vermont, Rhode Island.</li></ul></li></ul>"),
    
    TravelGuide(title: "Boston, USA", coordinate: CLLocationCoordinate2D(latitude: 42.364506, longitude: -71.038887), tripTitle: "Summer Internship", startDate: "6/19/17", endDate: "8/04/17", tripOverview: "test")
    
    ])


class AllTheGuides: NSObject, NSCoding {
    
    var delegate: AllTheGuidesModelListenerProtocol?
    
    var guides = [TravelGuide]()
    
    init(guideModel: [TravelGuide]) {
        guides = guideModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let guideHelper = aDecoder.decodeObject(forKey: "guides") as? [TravelGuide] {
            globalModel.guides = guideHelper
        } else {
            return nil
        }
    }
    
    // MARK: NSCoding protocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(guides, forKey: "guides")
    }
    
    func numGuides() -> Int {
        return guides.count
    }
    
    func titleAtIndex(at index: Int) -> String {
        return guides[index].title!
    }
    
    func coordAtIndex(at index: Int) -> CLLocationCoordinate2D {
        return guides[index].coordinate
    }

    
    func tripTitleAtIndex(at index: Int) -> String {
        return guides[index].tripTitle
    }
    
    
    func startDateAtIndex(at index: Int) -> String {
        return guides[index].startDate
    }
    
    func endDateAtIndex(at index: Int) -> String {
        return guides[index].endDate
    }
    
    func tripOverviewAtIndex(at index: Int) -> String {
        return guides[index].tripOverview
    }
    
    func addGuide(guide: TravelGuide) {
        guides.append(guide)
        delegate?.itemsChanged()
    }
    
    func editGuide(itemIndex: Int, changedGuide: TravelGuide) {
        guides[itemIndex] = changedGuide
        delegate?.itemsChanged()
    }
    
    func removeGuide(index: Int) {
        guides.remove(at: index)
        delegate?.itemsChanged()
    }
}

