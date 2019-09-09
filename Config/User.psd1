@{
    Revit = @{
        Install=@{
            R2019 = @{
                Path = '\\network\R2019.2\rvt\Setup.exe'
                Args = '/t /qb /w /language en-us /c RVT: INSTALLDIR="%programFiles%\Autodesk" CP_PREFERENCE=RVT-en-US-i CP_SELECTED="RVT-en-US-i;RVT-en-US-m;RVT-en-AU-m;RVT-en-GB-m;RVT-en-NZ-m" ACADSERIALPREFIX=399 ACADSERIALNUMBER=99999999 ADLM_PRODKEY=829K1 ADLM_EULA_COUNTRY=US InstallLevel=5 ACADSTANDALONENETWORKTYPE="3" ACAD_LICENSESERVER_DISTRIBUTED="1" ACADLICENSESERVERTYPE="Distributed Server License" ACADLICENSETYPE="Network License" ACADSERVERPATH="@License-Server"'
            } 
        }
        Sandbox = @{
            Dev = @{
                Source='\\network\2021'
                Mask='Sandbox_*.zip'
                Destination='C:\Sandbox'
                TargetFolder='LatestSandbox'
            }
        }
    }
    Autocad = @{
        Install=@{
            R2020 = @{
                Path = '\\network\MASTER\Setup.exe'
                Args = '/t /qb /language en-us /c ACAD_MAIN: ACADSERIALPREFIX="399" ACADSERIALNUMBER="99999999" ADLM_PRODKEY="001L1" ADLM_EULA_COUNTRY="US" InstallLevel=5 ACADSTANDALONENETWORKTYPE="3" ACADLICENSESERVERTYPE="Single Server License" ACADLICENSETYPE="Network License" ACADSERVERPATH="license-server 000000000000"'
            } 
        }
    }
}