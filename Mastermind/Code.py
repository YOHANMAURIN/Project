#Possible color: red, yellow, blue, orange, green, white
#black pion = good place, pion blanc= good pion but the bad place, bad color = there isn't this pion
#erreur géré --> gestion des doublons (si l'on met 2 fois la même couleur), couleur mal écrite, si la personne ne rentre pas le bon type,
                #language que l'on souhaite (français, français abréviation, anglais abreviation), input que l'on souhaite.


print ("Hello, if you don't know the rules you can have them by calling :\n"
       "- 'RulesOfTheGameFr()' function for the rules in french\n"
       "- 'RulesOfTheGameEn()' function for the rules in english.\n"
       "Otherwise you can directly play using the 'Mastermind(color1, color2, color3, color4)' function.\n"
       "For this game you can play with the french color, english color, english color abreviation (r,y,b,o,g,w) or french color abreviation (re,ja,ble,or,ve,bla)\n"
       "His an example to play Mastermind: 'Mastermind('red','yellow','green','yellow')")

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


def Mastermind(color1, color2, color3, color4) :
    #Enter in hard the colors you want to search your opponent.
    choice = ["b", "y", "g", "w"] #you can choose the format that you want

    #input de la fonction
    inputt = [color1, color2, color3, color4]
    
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
        good_color_good_place = "black"
        good_color_bad_place = "white"
        bad_color_bad_place = "bad color"
    if english_abreviation>max (english, french, french_abreviation):
        possible_color = possible_color_english_abreviation
        choice = transformation(choice,"english_abreviation")
        spelling_mistake = "You made a spelling mistake. The different possibilities are : r, y, b, o, g and w"
        type_error = "You made a type error. The type of colors must be a string."
        good_color_good_place = "black"
        good_color_bad_place = "white"
        bad_color_bad_place = "bad color"
    if french>max (english_abreviation, english, french_abreviation):
        possible_color = possible_color_french
        choice = transformation(choice,"french")
        spelling_mistake = "Vous avez fait une erreur d'ortographe. Les différentes possibilités sont : rouge, jaune, bleu, orange, vert et blanc"
        type_error = "Vous avez fait une erreur de typage. Le type des couleurs doit être un string."
        good_color_good_place = "noir"
        good_color_bad_place = "blanc"
        bad_color_bad_place = "mauvaise couleur"
    if french_abreviation>max (english_abreviation, french, english):
        possible_color = possible_color_french_abreviation
        choice = transformation(choice,"french_abreviation")
        spelling_mistake = "Vous avez fait une erreur d'ortographe. Les différentes possibilités sont : ro, ja, ble, or, ve et bla"
        type_error = "Vous avez fait une erreur de typage. Le type des couleurs doit être un string."
        good_color_good_place = "noir"
        good_color_bad_place = "blanc"
        bad_color_bad_place = "mauvaise couleur"
          
    #spelling verifications
    error2 = spelling_verifications(inputt)
            
    #error explanation
    if error1 == True:
        return(type_error)
    if error2 == True:
        return(spelling_mistake)
    #Mastermind games
    if (choice == inputt):
        return("Congratulation you succeed!")
    else:
        answer =[]
        size = len(inputt)
        for i in range (0,size):
            if inputt[i] == choice[i]:
                choice[i]="" #remove the element already found to handle duplicates
                answer.append(good_color_good_place)
            elif inputt[i] in choice:
                for j in range (0,len(choice)):
                     if inputt[i]==choice[j]:
                        choice[j]=""
                answer.append(good_color_bad_place)
            else:
                answer.append(bad_color_bad_place) #He is also possible to return nothing if he don't find a good color
        mix_answer=[answer[3],answer[1],answer[2],answer[0]]
        return(mix_answer)


def type_verification(input_list,input_type):
    error = False
    for i in range (0,len(input_list)):
        if type(input_list[i])!= input_type :
            error = True
    return(error)

def spelling_verifications(input_list):
    possible_color_english = ["red", "yellow", "blue", "orange", "green", "white"]
    possible_color_english_abreviation = ["r","y","b","o","g","w"]
    possible_color_french = ["rouge", "jaune", "bleu", "orange", "vert", "blanc"]
    possible_color_french_abreviation = ["re","ja","ble","or","ve","bla"]
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

def transformation(input_list,language):
    #dictionary declared as follows: french, french_abreviation, english, english_abreviation
    dictionnary = [["rouge","r","red","r"],
                   ["jaune","j","yellow","y"],
                   ["bleu","ble","blue","b"],
                   ["orange","o","orange","o"],
                   ["vert","v","green","g"],
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
