import Foundation

class CoronaClass {

    var seats = [Int]()
    let numberOfSeats: Int!

    init(n: Int) {
        numberOfSeats = n
    }

    func seat() -> Int {
        let emptySeats = (0..<numberOfSeats).filter { !seats.contains($0) }
        var emptySeatStats = [Int:Int]()

        for seat in emptySeats {
            var emptySeatsToTheLeft = 0
            while emptySeats.contains(seat - emptySeatsToTheLeft - 1) {
                emptySeatsToTheLeft += 1
            }
            if seat == 0 { emptySeatsToTheLeft = 100 }

            var emptySeatsToTheRight = 0
            while emptySeats.contains(seat + emptySeatsToTheRight + 1) {
                emptySeatsToTheRight += 1
            }
            if seat == numberOfSeats - 1 { emptySeatsToTheRight = 100 }

            emptySeatStats[seat] = min(emptySeatsToTheLeft, emptySeatsToTheRight)
        }

        var seatToTake = emptySeats[0]
        for seat in emptySeats.dropFirst() {
            if emptySeatStats[seat]! > emptySeatStats[seatToTake]! {
                seatToTake = seat
            }
        }

        seats.append(seatToTake)
        seats.sort()
        return seatToTake
    }

    func leave(_ p: Int) {
        seats = seats.filter { $0 != p}
    }
}
