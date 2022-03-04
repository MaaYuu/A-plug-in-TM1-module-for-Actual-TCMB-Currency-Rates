import configparser
import keyring
from TM1py.Services import TM1Service
from evds import evdsAPI
import sys
from datetime import datetime
import os
import pandas

parentpath = os.path.dirname(os.getcwd())
configfile = parentpath + '\TM1Config\py_config.ini'
configfile = configfile.replace("\\", "/")

csvfile = os.path.abspath(os.getcwd()) + '/TCMB_Currency.csv'  
csvfile = csvfile.replace("\\", "/")

df = pandas.read_csv(csvfile, header=1,sep=';')
dim_elements = df['#root'].tolist()

config = configparser.ConfigParser()
config.read(configfile)

INSTANCE = "tm1srv01"
user = config[INSTANCE]["user"]

# interact with Windows Credential Manager through the keyring library
password = keyring.get_password(INSTANCE, user)
config[INSTANCE]["password"] = password

api_pass = keyring.get_password('tcmb_credentials', 'api_user')

#startdate = "2020-05-25"
startdate = sys.argv[1]
startdate = datetime.strptime(startdate, '%Y-%m-%d').strftime('%d-%m-%Y')
        
#enddate = "2020-05-31" 
enddate = sys.argv[2] 
enddate = datetime.strptime(enddate, '%Y-%m-%d').strftime('%d-%m-%Y')

evds = evdsAPI(api_pass)

series = evds.get_series('bie_dkdovytl')['SERIE_CODE'].values.tolist()
series = [serie for serie in series if serie[10:11]!='C']
series2 = [serie + '-1' for serie in series] 

series_ = [serie.replace(".", "_") for serie in series]
series2_ = [serie.replace(".", "_") for serie in series2]

formulas = [1] * len(series)

data1 = evds.get_data(series=series, startdate=startdate,enddate=enddate,raw=True)
data2 = evds.get_data(series=series, startdate=startdate, enddate=enddate,formulas=formulas,raw=True) 

cellset = {}
cReferenceCurrency = 'TRY'

with TM1Service(**config[INSTANCE]) as tm1:
    
    # import rates
    for my_dict in data1: 
        
        tarih = my_dict["Tarih"]
        tarih = datetime.strptime(tarih, '%d-%m-%Y').strftime('%Y-%m-%d')
        
        
        for i in series_:
            value = my_dict[i]
            vCurrency = i[6:9]
            vRate = i[10:11]
            
            if vRate == 'A':
                vRate = 'Buy Rate'
            else:
                vRate = 'Sell Rate'

            if vCurrency in dim_elements:
                cellset[(tarih, vCurrency, cReferenceCurrency, vRate)] = value

    # Import percent changes
    for my_dict in data2: 
        tarih = my_dict["Tarih"]
        tarih = datetime.strptime(tarih, '%d-%m-%Y').strftime('%Y-%m-%d')

        for i in series2_:
            value = my_dict[i]
            if value == 'ND':
                value = 0
            vCurrency = i[6:9]
            vRate = i[10:11]

            if vRate == 'A':
                vRate = 'Buy Rate'
            else:
                vRate = 'Sell Rate'
            
            vLastTwo = i[-2:]
            if vLastTwo == '-1':
                vRate = 'Percent Change in '+ vRate + ' (Daily)'
            if vCurrency in dim_elements:
                cellset[(tarih, vCurrency, cReferenceCurrency, vRate)] = value

    # # send the cellset to TM1
    cCube = 'TCMB_CurrencyRates'
    tm1.cubes.cells.write_values(cCube, cellset)