# Floating-buttons
- 야곰의 오토레이아웃 정복하기 


<img src = "https://user-images.githubusercontent.com/26668309/159605079-0b2eadf6-d288-43c9-aea7-71871642b4b3.gif" width=20%>



# AutoLayout 
- 스택 뷰가 플로팅 될때 button 의 top 과 stackView 의 top 이 겹치는데 button 의 priority 를 낮춰서 해결  

```swift 
    button.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).priority(.low)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
    }
    
    stack.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(menuButton.snp.top).offset(-8)
            make.top.equalTo(self.snp.top).priority(.high)
     }  
```
