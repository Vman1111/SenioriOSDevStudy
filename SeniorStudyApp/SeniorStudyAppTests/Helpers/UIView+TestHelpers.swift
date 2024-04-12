//
//  Created by Vytautas Sapranavicius on 12/04/2024.
//


import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
