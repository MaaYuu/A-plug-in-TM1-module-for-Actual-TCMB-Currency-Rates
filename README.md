# A plug-in TM1 module for Actual-TCMB-Currency-Rates

This module files are directly embeddable into existing server. 
With the help of chores, it automatically takes TCMB(Turkish Central Bank) currency rates in specified basis or just run the process to consume
data whenever it is wanted.

**Installation:**

• TM1py
• evds


**Installation:**


• Python should be installed from the link ../Upgrade_for_TCMB_CurrencyRates/**python-3.7.6-amd64.exe.**
    o	The default installation location is “E:/Python”. When another folder is selected, the pyExe variable in the **TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS** process should change accordingly.

• In the ..\Upgrade_for_TCMB_CurrencyRates folder, with the command of
**pip install -r Python_Packages/requirements.txt --no-index --find-links Python_Packages**
the required packages under Python_Packages folder should be installed

• In the Upgrade_for_TCMB_CurrencyRates/TM1Config/py_config.ini file, the configurations under **tm1srv1** must be changed correctly in accordance with the relevant server.

• Afterwards, both the EVDS API key and the user password that imports the relevant data must be saved in the Windows Credential Manager.
    o	 The following IDs should be created as in the attached ID and user names.

![image](https://user-images.githubusercontent.com/35421890/156721206-f2c6f26e-552f-40f2-ac7c-1e0b23c27553.png)

  
•	EVDS API key can be obtained by creating a user from the link below.
    o	 https://evds2.tcmb.gov.tr/index.php?/evds/login
    
• After that, after moving the files from the **Upgrade_for_TCMB_CurrencyRates** folder and restarting the TM1 server as usual, the TCMB_Upgrade_for_TCMB_CurrencyRates process should be run.
    o	This process will give minor errors in the first run, it should be run again. The second run should also complete successfully.

• The TM1 server must be restarted after the upgrade in order to create the default cube view.

• In some cases, the commands do not work when the TM1 Server is Local System Account, in this case, a user who can run the commands should be determined from "Services" instead of Local System Account.

• **TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS process** needs to work with the relevant parameters in order to fetch the currency rates.

• In order to import exchange rate data, https://evds2.tcmb.gov.tr/service/evds/ and related sub-addresses must be opened to internet access.
