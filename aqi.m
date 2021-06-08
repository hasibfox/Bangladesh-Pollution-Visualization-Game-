clc

%MAIN MENU
mat=xlsread('Book1', 'Sheet1');

%Extract info from the statistics sheets.
Population = mat(:, 1);
Area = mat(:, 2);
aqiIndex = mat(:, 3);

%Create string array of city names
cities = ["Dhaka","Chittagong","Khulna", "Rajshahi","Gazipur","Sylhet" , "Mymensingh", "Barisal", "Rangpur","Comilla", "Narayanganj","Jessore"];
bcities = ["Osaka","Dhaka","Karachi","New York","Beijing","Cairo","Sao Paulo","Mexico City","Shanghai","Mumbai","Delhi","Tokyo"];
bdcitiesorder = ["Narayanganj","Comilla","Rangpur","Barisal","Sylhet","Mymensingh","Narail","Rajshahi","Gazipur","Khulna","Chittagong","Dhaka"];
%Create description for user for each city
descriptions = [ 
    "As one of the most densely populated cities in the world, Dhaka is always at the risk of pollution where smoke from brick kilns, smoke from motor and traffic and dust generated from constructions are mainly responsible for air pollution.", ...
    "Air pollution caused by emission of black smokes from unfit vehicles and dust from open space result in the increase of bronchitis, asthma and respiratory related diseases among the city dwellers for years.", ...
    "Specific causes for air pollution in Khulna are wood burning in brick kilns, absence of dust collectors in cement factories, coal stacking in open place, old battery recycling, burning tyres for making oil and making powder ink from straw burning in the city.", ...
    "Rajshahi dust blown up from dry riverbeds, fields and roads, and choking smog from ranks of brick kilns on the edge of town helped to secure the place a spot in the top tier of the world's most polluted cities",...
    "The prime local sources of PM pollution in Gazipur are vehicles, brick kilns, and fugitive dusts.", ...
    "They said some vehicles spread leads and other harmful matters in the air. The dust also causes heavy air pollutions in the city. And the dust makes the air thicker. Especially on streets, pedestrians, particularly old and children, suffer most to take breath for the thick air with dust and sands. While visiting different city areas this reporter found full of bad smells of un-moved garbage that also caused air pollution. The huge smokers of the city also produce smokes, which are also caused air pollutions. Though the smoking in public place is banned by law, the smokers violate the rule and frequently smoke on streets, bus stands and other places of public gatherings. It also harms children's health seriously.",...
    "There  are  various  sources  of  air  pollution  in Mymensingh  city,  among  them  unfit  vehicles  and industries are notable. Though green landscape around Mymensingh city and monsoon heavy rainfall helps to reduce  the  intensity  of  air  pollution,  a  significant change in land uses and human intervention aggravate the degradation of air quality.",...
    "Check infographic for Barisal",...
    "Across households in Rangpur, general pollution varies across households to choices of cooking fuel, cooking locations, construction materials and ventilation practices.",...
    "80 per cent of air pollution in Comilla is caused by emitting huge quantity of toxic smoke from unfitness vehicles like cars, buses, trucks, taxies, minibuses, trains and others. Unfitness vehicles, especially, those have problems in engine are greatly responsible for air pollution.",...
    "Check infographic for Narayanganj",...
    "Cross-household variation in Jessore is strongly affected by structural arrangements: cooking locations, construction materials, and ventilation practices."
];

%BIGGEST CITIES MENU
bc=xlsread('Book1', 'Sheet2');
bco=xlsread('Book1', 'Sheet3');

bcPopulation = bc(:, 1);
bcArea = bc(:, 2);
bcaqiIndex = bc(:, 3);
bdCitiesOrdered = sort(Population);
bdCitiesAqiOrder = bco(:,3);


%Preset some variables.
response = "5";


while response ~= "7"
    whichinfo = "nothing";
    confirm = "nothing";
    wouldgraph = "nothing";
    biggestcities = "nothing";
    %Different options that a user can choose for main option
    response = string(input("Would you like to see?" + newline + ...
         "1. A Population Density graph" + newline + ...
         "2. A Population vs AQI Index graph" + newline +...
         "3. An Area vs AQI Index graph" + newline +...
         "4. I want to play a game!" + newline +...
         "5. I would like to learn more about AQI Indexes or Pollution in Bangladesh" + newline +...
         "6. How do these cities compare with the biggest cities in the world?" + newline +...
         "7. Exit" + newline));
    %Making a population density (population vs Area) graph
    if response == "1"
        makeGraph(Population,Area, cities, "Population (mil)", "Area (km^2)",'o'	);
    %Making a population vs AQI Index graph
    elseif response == "2"
        makeGraph(Population,aqiIndex, cities, "Population (mil)", "AQI Index",'s');
    %Making an area vs AQI Index graph
    elseif response == "3"
        makeGraph(Area,aqiIndex, cities, "Area(km^2)", "AQI Index", 'd');
        %Interactivity for user to guess the AQI index and see their
        %guesses graphed against the actual responses
    elseif response == "4"
        guesses = [];
        i = 1;
      %  cities = ["Dhaka","Chittagong","Khulna"
       %"Rajshahi","Gazipur","Sylhet"
       %"Mymensingh", "Barisal", "Rangpur"
       %"Comilla", "Narayanganj","Jessore"];
   
        while i <= 12
            if cities(i) == "Barisal"
                b = imread('Barisal.png');
                imshow(b);
                title("General Pollution Chart for " + cities(i))
                z = input(strcat("Here is a brief information graphic of the pollution scenario in " + cities(i) +":" + newline + descriptions(i) + newline + "What is your guess for " + cities(i) + "'s AQI Index? " + newline));
                guesses(i,1) = z;
                i= i + 1;
            end
            if cities(i) == "Narayanganj"
                n = imread('Narayanganj.png');
                imshow(n);
                title("General Pollution Chart for " + cities(i))
                z = input(strcat("Here is a brief information graphic of the pollution scenario in " + cities(i) +":" + newline + descriptions(i) + newline + "What is your guess for " + cities(i) + "'s AQI Index? " + newline));
                guesses(i,1) = z;
                i= i + 1;
            end
            z = input(strcat("Here is a brief information graphic of the pollution scenario in " + cities(i) +":" + newline + descriptions(i) + newline + "What is your guess for " + cities(i) + "'s AQI Index? " + newline));
            guesses(i,1) = z;
            i= i + 1;
        end
        wouldgraph = string(input("Would you like to view a graph of your" + ...
            " guesses versus the actual statistics?" + newline + "1. Yes" + newline + "2. No" + newline));
        if wouldgraph == "1"
            %Left Plot
            subplot(1,2,1);
            makeGraph(Population,aqiIndex, cities, "Population (mil) ", "AQI Index",'o');   
            
            %Right Plot
            subplot(1,2,2); 
            makeGraph(Population, guesses , cities, "Population (mil)", "Your AQI Index Guesses",'p'	);

            set(0,'defaultfigureposition',[20 100 1500 600])

        else
                confirm = string(input("Are you sure you do not want to see the graph?" + newline + "1. Yes" + newline + "2. No" + newline));
                if confirm =="2"
                    %Left Plot
                subplot(1,2,1);
                makeGraph(Population,aqiIndex, cities, "Population (mil)", "AQI Index",'o');   
           
                %Right Plot
                subplot(1,2,2); 
                makeGraph(Population, guesses , cities, "Population (mil)", "Your AQI Index Guesses",'p'	);

                set(0,'defaultfigureposition',[20 100 1500 600])
                
                end
        end
    elseif response == "5"
        while whichinfo ~= "3"
            whichinfo = string(input("Would you like to learn more about AQI Indixes or the pollution situation in Bangladesh?" + newline + "1. AQI Indexes" + newline + "2. Bangladesh Pollution Situation" + newline + "3. I'm done learning!" + newline));
            if whichinfo == "2"
                disp("Air pollution kills 195,000 Bangladeshi each year, according to World Health Organisation (WHO) 2016 estimates." + newline + "In 1995, the average ozone concentration in Mexico City was about 0.15 parts per million, 10 times the natural atmospheric concentration and twice the maximum permitted in Japan or the United States. The density of lead in the air of Dhaka is 463 nanograms per cubic metre, which is 10 times more than the acceptable standard and several times more than the above-mentioned cities, even than the most polluted city of Mexico." + newline + "The large number of children, street children, local streetwalkers, and rickshaw pullers in Dhaka City are at particular risk from this air pollution. Young children are mostly exposed to cadmium through inhalation of smoke and contaminated soils and dust from industrial emissions and sewage sludge. In 1999 environmental scientists said that the high lead in the environment from gasoline, paints, ceramics, batteries, etc. are factors in the increased risk of polluted air. Another study revealed that blood lead levels were very high and at toxic levels in children presenting with psychomotor delay and behavioral problems, indicating lead poisoning." + newline + "There are two major sources of air pollution in Bangladesh: Vehicular emissions and industrial emissions. These are mainly concentrated in the cities. There are also many brick-making kilns operated seasonally, mainly in dry season all over Bangladesh. Most of these kilns use coal and wood as their prime sources of energy, resulting in the emission of particulate matter, oxides of sulfur, and volatile organic compounds. Additionally used rubber wheels of vehicles are burnt, which produce black carbon and toxic gases. These are harmful for health. In order to accommodate the growing population, the construction of high-rise buildings is growing rapidly. Along with these buildings, the numbers of slums are also growing. The tremendous force of population has made it almost unfeasible to maintain a clean environment in the capital city of Dhaka." + newline + "Dhaka is also one of the most densely populated cities in the world, with an estimated population of more than 8 million. Air pollution has emerged as an acute problem in the city. Blackening of the city air and reduced visibility can be observed at times. Occurrence of choking smells and irritated eyes are common, as mentioned by Khaliquzzaman, in his report, which was published at the Consultative Meeting on Integrated Approach to Vehicular Air Pollution Control in Dhaka held between April 26-27, 1998. According to the WHO report 2001, the lead concentration found in the blood of children in Dhaka was up to four times higher acceptable levels." + newline);
            elseif whichinfo =="1"
                disp("Think of the AQI as a yardstick that runs from 0 to 500. The higher the AQI value, the greater the level of air pollution and the greater the health concern. For example, an AQI value of 50 or below represents good air quality, while an AQI value over 300 represents hazardous air quality." + newline + "For each pollutant an AQI value of 100 generally corresponds to an ambient air concentration that equals the level of the short-term national ambient air quality standard for protection of public health. AQI values at or below 100 are generally thought of as satisfactory. When AQI values are above 100, air quality is unhealthy: at first for certain sensitive groups of people, then for everyone as AQI values get higher." + newline);
            end
        end
    elseif response == "6"
        while biggestcities ~= "5"
            biggestcities = string(input("Would you like to see for the worlds largest cities?" + newline + ...
             "1. A Population vs AQI Index graph" + newline +...
             "2. A Population Density graph" + newline +...
             "3. A Population vs AQI Index graph" + newline +...
             "4. Bangladesh Cities against Biggest Cities in Population vs AQI Indexes?" + newline +...
             "5. Exit" + newline));

            %Making a population vs AQI Index graph
            if biggestcities == "1"
                makeGraph(bcPopulation,bcaqiIndex, bcities, "Biggest Cities Population (mil)", "AQI Index",'s');
           %Making a population density graph
            elseif biggestcities == "2"
                makeGraph(bcPopulation,bcArea, bcities, "Biggest Cities Population (mil)", "Area (km^2)",'+');
            elseif biggestcities == "3"
                makeGraph(bcArea,bcaqiIndex, bcities, "Biggest Cities Population (mil)", "Area (km^2)",'d');
            elseif biggestcities == "4"
                %Left Plot
                subplot(1,2,1);
                makeGraph(bdCitiesOrdered,bdCitiesAqiOrder, bdcitiesorder, "Bangladesh Cities Population (mil)", "AQI Index",'o');   
           
                %Right Plot
                subplot(1,2,2); 
                makeGraph(bcPopulation, bcaqiIndex , bcities, "Biggest Cities Population (mil)", "AQI Index",'p');

                set(0,'defaultfigureposition',[20 100 1500 600])
               
            end
        end
    end
end