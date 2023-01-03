
import SwiftUI

struct MainCalculationButton: View {
    @EnvironmentObject var result: CalculationData
    var isTapped: Bool = false
    var calculationSign: String
    
    var body: some View {
        Button(action: {
            result.buttonIndex = calculationSign
            if calculationSign == "﹦" {
                result.buttonIndex = ""
                result.temporaryData = Double(result.displayData) ?? 0
                
                if result.temporaryData == 0 {
                    result.displayData = result.error.toString() // 0으로 나눌 경우 error 메시지 표기
                }
                else {
                    result.finalData = calculations(sign: result.operation, a: result.firstData, b: result.temporaryData)
                    result.displayData = String(result.finalData)
                }
                result.isReceived = true
                result.temporaryData = result.firstData
                
                
            } else {
                result.operation = calculationSign
                result.isReceived = true
                result.firstData = Double(result.displayData) ?? 0
            }
            
        }){
            Text(calculationSign)
                .font(.system(size: 30).bold())
                .foregroundColor(result.buttonIndex == calculationSign ? .mainCalButtonColor : .white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(result.buttonIndex == calculationSign ? .white : .mainCalButtonColor))
        }
    }
}
