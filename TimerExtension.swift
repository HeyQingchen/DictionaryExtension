//
//  TimerExtension.swift
//
//  Created by Qingche on 16/5/26.
//

import UIKit

class CustomTimerBlock<T> {
  let f : T
  init (_ f: T) { self.f = f }
}

extension Timer {

  public static func scheduleTimerWithTimeInterval(_ interval:TimeInterval, block: @escaping (() -> Void),repeats:Bool) -> Timer {
   return Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.customTimerBlockInvoke(_:)), userInfo: CustomTimerBlock(block), repeats: repeats)
  }

  public static func timerWithTimeInterval(_ interval:TimeInterval, block: @escaping (() -> Void), repeats:Bool) -> Timer {
    return Timer(timeInterval: interval, target: self, selector: #selector(self.customTimerBlockInvoke(_:)), userInfo: CustomTimerBlock(block), repeats: repeats)
  }

  public static func customTimerBlockInvoke(_ timer:Timer) {
    let block = timer.userInfo as? CustomTimerBlock<() -> Void>
    block?.f()
  }
}
