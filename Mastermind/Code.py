#On this program, there is exactly the rules than as on https://fr.wikipedia.org/wiki/Mastermind
#Possible color: red, yellow, blue, orange, green, white
#black pawns = good place, white pawns = good pion but the bad place

from random import randrange

print ("Hello, if you don't know the rules you can have them by calling :\n"
       "- 'RulesOfTheGameFr()' function for the rules in french\n"
       "- 'RulesOfTheGameEn()' function for the rules in english.\n"
       "Otherwise you can directly play using the 'Mastermind()' function.\n"
       "For this game you can play with the french color, english color, english color abreviation (r,y,b,o,g,w) or french color abreviation (re,ja,ble,or,ve,bla)\n")

def RulesOfTheGameFr():
       print("Le but est de découvrir les quatre pions, c'est-à-dire leurs couleurs et leurs positions.\n"
             "Pour cela, à chaque tour, le joueur doit choisir 4 pions à l’endroit où il pense que les pions corrects sont dissimulés.\n"
             "Une fois les pions placés, le code indique :\n"
             "1. Le nombre de pions de la bonne couleur bien placés en utilisant le même nombre de pions noirs.\n"
             "2. Le nombre de pions de la bonne couleur, mais mal placés, avec les pions blancs.\n"
             "Les couleurs possibles sont rouge, jaune, bleu, orange, vert et blanc")
def RulesOfTheGameEn():
       print("The goal is to discover the four pawns, i.e. their colors and positions.\n"
             "For this, each round, the player must choose 4 pawns where he thinks the correct pawns are concealed.\n"
             "Once the pawns are placed, the code indicates:\n"
             "1. The number of pawns of the right color well placed using the same number of black pawns.\n"
             "2. The number of pawns of the right color, but poorly placed, with the white pawns.\n"
             "The possible colors are red, yellow, blue, orange, green and white")

def NewGames(): #Permit to generate a combinaison of pawns
       possibility = ["r","y","b","o","g","w"]
       i=0
       choice=[]
       while i<4:
              random_number=randrange(0,5)
              choice.append(possibility[random_number])
              i=i+1
       return choice

def Mastermind() :
    choice = NewGames() #Generate the combination of pawns you need to find
    choice_tempo = choice
    victory = False
    print(choice)
    while (victory == False):
       
       #input choice by the user
       inputt=[]
       inputt1 = input("Choose your fisrt color :")
       inputt.append(inputt1)
       inputt2 = input("Choose your second color :")
       inputt.append(inputt2)
       inputt3 = input("Choose your third color :")
       inputt.append(inputt3)
       inputt4 = input("Choose your fourth color :")
       inputt.append(inputt4)
       
           
       #type verifications
       error1 = type_verification(inputt,str)

       #language detection
       possible_color_english = ["red", "yellow", "blue", "orange", "green", "white"]
       possible_color_english_abreviation = ["r","y","b","o","g","w"]
       possible_color_french = ["rouge", "jaune", "bleu", "orange", "vert", "blanc"]
       possible_color_french_abreviation = ["re","ja","ble","or","ve","bla"]
       english=0
       english_abreviation=0
       french=0
       french_abreviation=0
       for i in range (0,4):
           if inputt[i] in possible_color_english:
               english=english+1
           if inputt[i] in possible_color_english_abreviation:
               english_abreviation=english_abreviation+1
           if inputt[i] in possible_color_french:
               french=french+1
           if inputt[i] in possible_color_french_abreviation:
               french_abreviation=french_abreviation+1
       if english>max (english_abreviation, french, french_abreviation):
           possible_color = possible_color_english
           choice = transformation(choice,"english")
           spelling_mistake = "You made a spelling mistake. The different possibilities are : red, yellow, blue, orange, green and white"
           type_error = "You made a type error. The type of colors must be a string."
           succeed = "Congratulation you succeed!"
           good_color_good_place = "black"
           good_color_bad_place = "white"
           bad_color_bad_place = "bad color"
       if english_abreviation>max (english, french, french_abreviation):
           possible_color = possible_color_english_abreviation
           choice = transformation(choice,"english_abreviation")
           spelling_mistake = "You made a spelling mistake. The different possibilities are : r, y, b, o, g and w"
           type_error = "You made a type error. The type of colors must be a string."
           succeed = "Congratulation you succeed!"
           good_color_good_place = "black"
           good_color_bad_place = "white"
           bad_color_bad_place = "bad color"
       if french>max (english_abreviation, english, french_abreviation):
           possible_color = possible_color_french
           choice = transformation(choice,"french")
           spelling_mistake = "Vous avez fait une erreur d'ortographe. Les différentes possibilités sont : rouge, jaune, bleu, orange, vert et blanc"
           type_error = "Vous avez fait une erreur de typage. Le type des couleurs doit être un string."
           succeed = "Bravo vous avez réussi!"
           good_color_good_place = "noir"
           good_color_bad_place = "blanc"
           bad_color_bad_place = "mauvaise couleur"
       if french_abreviation>max (english_abreviation, french, english):
           possible_color = possible_color_french_abreviation
           choice = transformation(choice,"french_abreviation")
           spelling_mistake = "Vous avez fait une erreur d'ortographe. Les différentes possibilités sont : ro, ja, ble, or, ve et bla"
           type_error = "Vous avez fait une erreur de typage. Le type des couleurs doit être un string."
           succeed = "Bravo vous avez réussi!"
           good_color_good_place = "noir"
           good_color_bad_place = "blanc"
           bad_color_bad_place = "mauvaise couleur"
       if max(english_abreviation, french, english, french_abreviation) == 0: #if you don't put this line, there will be an error if you put 2 colors names in french and 2 colors names in english
           spelling_mistake = "Use French or English colors or abbreviations."
             
       #spelling verifications
       error2 = spelling_verifications(inputt)
                 
       #error explanation
       if error1 == True:
           print(type_error)
       else:    
           if error2 == True:
               print(spelling_mistake)
           #Mastermind games
           else:
               if choice == inputt:
                   victory = True
                   return(succeed)
               else:
                   answer =[]
                   size = len(inputt)
                   good_answer_bad_place=0
                   good_answer=0
                   for i in range (0,size):
                      if inputt[i] == choice[i]:
                          choice[i]="" #remove the element already found to handle duplicates
                          good_answer = good_answer + 1
                      if inputt[i] in choice:
                          for j in range (0,len(choice)):
                               if inputt[i]==choice[j]:
                                   choice[j]=""
                          good_answer_bad_place = good_answer_bad_place + 1
                   while good_answer !=0: #allows to put black pawns first in the results display
                          answer.append(good_color_good_place)
                          good_answer = good_answer - 1
                   while good_answer_bad_place != 0: #allows to put white pawns after the black pawns in the results display
                          answer.append(good_color_bad_place)
                          good_answer_bad_place = good_answer_bad_place - 1
                   choice=choice_tempo #allows to set the variable choice equal to the combination that must be found

#Program that verifies if all the elements of the same list are of the same type as what we chose
def type_verification(input_list,input_type):
    error = False
    for i in range (0,len(input_list)):
        if type(input_list[i])!= input_type :
            error = True
    return(error)

#Program that verifies if the input colors are well spelled
def spelling_verifications(input_list):
    possible_color_english = ["red", "yellow", "blue", "orange", "green", "white"]
    possible_color_english_abreviation = ["r","y","b","o","g","w"]
    possible_color_french = ["rouge", "jaune", "bleu", "orange", "vert", "blanc"]
    possible_color_french_abreviation = ["ro","ja","ble","or","ve","bla"]
    error = True
    size=len(input_list)
    english = 0
    english_abreviation = 0
    french = 0
    french_abreviation = 0
    for i in range (0,size):
        if input_list[i] in possible_color_english :
            error = False
            english = english + 1
        elif input_list[i] in possible_color_english_abreviation :
            error = False
            english_abreviation = english_abreviation + 1
        elif input_list[i] in possible_color_french :
            error = False
            french = french + 1
        elif input_list[i] in possible_color_french_abreviation :
            error = False
            french_abreviation = french_abreviation + 1
        else :
            return(True)
    number_of_words=[english, english_abreviation, french, french_abreviation] #normally if it's the same language there is only 1 item in the list that is different from 0
    number_of_words.remove(max(number_of_words))#We remove the only item from the list that is different from 0
    if (max(number_of_words)!=0): #If there is something different from 0 that means that he switched language at one time 
        return(True)
    return(error)

#Program allows to transform a list from one format to another (example: English abreviation colors to French colors)
def transformation(input_list,language):
    #dictionary declared as follows: french, french_abreviation, english, english_abreviation
    dictionnary = [["rouge","ro","red","r"],
                   ["jaune","ja","yellow","y"],
                   ["bleu","ble","blue","b"],
                   ["orange","or","orange","o"],
                   ["vert","ve","green","g"],
                   ["blanc","bla","white","w"]]
    if (language == "french"):
        language=0
    if (language == "french_abreviation"):
        language=1
    if (language == "english"):
        language=2
    if (language == "english_abreviation"):
        language=3
    size=len(input_list)
    color_list_tranform =[]
    for k in range (0,size):
        for i in range (0,6):
            for j in range (0,4):
                if input_list[k] == dictionnary[i][j]:
                    a = dictionnary[i][language]
                    color_list_tranform.append(a)
    return(color_list_tranform)
