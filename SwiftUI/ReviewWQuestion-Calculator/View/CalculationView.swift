
import SwiftUI

struct CalculationView: View {
    @EnvironmentObject var result: CalculationData
    let columns = Array(repeating: GridItem(.fixed(80)), count: 3)
    
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(.black)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(alignment: .trailing){
                    displayText()
                    
                    HStack {
                        VStack{
                            HStack {
                                ForEach(SubCalculationCase.allCases, id:\.self){ sign in
                                    SubCalculationButton(sign: sign.rawValue)
                                }
                            }
                            LazyVGrid(columns: columns){
                                ForEach(Numbers.allCases, id:\.self){ number in
                                    NumberButton(number: number.rawValue)
                                }
                            }
                            HStack{
                                ZeroButton()
                                DotButton()
                            }
                        }
                        VStack{
                            ForEach(MainCalculation.allCases, id:\.self){ sign in
                                MainCalculationButton(sign: sign.rawValue)
                            }
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
            }
        }
    }
    
    private func displayText() -> some View {
        
        Text(result.displayData.count != 0 ? (result.isMinus == true ? "-\(result.displayData)" : result.displayData) : "0")
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 56).bold())
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
            .environmentObject(CalculationData())
    }
}
