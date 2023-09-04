fastfood_bot <- function(){
  print("Welcome to R Restaurant.")
  
  customer <- readline("What is your name? : ")
  print(paste("Hello!", customer))
  food1 <- readline("What do you want for today? : ")
  food1_num <- readline(paste("How many", food1, "do you want? : "))
  morefood <- readline("Do you want anything else? (yes or no): ")
  if(morefood == "no"){
    print(paste("Your order is", food1, food1_num,"."))
    applepie <- readline("Today we have a apple pie for special menu. Do you want some? (yes or no): ")
    if (applepie == "yes"){
      applepie_num <- readline(paste("How many apple pie do you want? : "))
      print(paste("Your order is", food1, food1_num,"and apple pie", applepie_num, "."))
      print("Thank you for your order!")
    } else {
    print("Thank you for your order!")}
    
  } else{
    food2 <- readline("What do you want? : ")
    food2_num <- readline(paste("Okay. How many", food2, "do you want? : "))
    applepie <- readline("Today we have a apple pie for special menu. Do you want some? (yes or no): ")
    if (applepie == "yes"){
      applepie_num <- readline(paste("How many apple pie do you want? : "))
      print(paste("Your order is", food1, food1_num,"and", food2, food2_num,"and apple pie", applepie_num, "."))
      print("Type 'Done' to stop conversation")
      moreelse <- readline("Do you want something else? What's it?: ")
      
       while (TRUE){
         if (moreelse == "Done"){
          break
        } else {
          moreelse_num <- readline(paste("How many", moreelse, "do you want? : "))
          print(paste("Okay", moreelse, moreelse_num))
          moreelse <- readline("Do you want something else? : ")
        }
      }
      
      print("Thank you for your order. Enjoy!")
    } else {
      print(paste("Your order is", food1, food1_num,"and", food2, food2_num,"."))
      print("Thank you for your order. Enjoy!")}
  }
}

fastfood_bot()
