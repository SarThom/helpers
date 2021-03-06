﻿[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline=$true)]
    [alias("ApiKey","Session")]
    $AuthToken
    
)

$AuthToken = Test-SEAuth -AuthToken $AuthToken
$Sensortype = "72AC0BFD-0B0C-450C-92EB-354334B4DAAB"
$result = @()

$customers = Get-SeApiMyNodesList -Filter customer -AuthToken $AuthToken
foreach ($customer in $customers) {
    $containers = Get-SeApiCustomerContainerList -AuthToken $AuthToken -CId $customer.id

    foreach ($container in $containers) {

        if ($container.subtype -eq "0") {

            foreach ($sensorhub in $containers) {

                if ($sensorhub.subtype -eq "2" -And $sensorhub.parentId -eq $container.id) {

                    $agents = Get-SeApiContainerAgentList -AuthToken $AuthToken -CId $sensorhub.id
                                       
                        foreach ($agent in $agents) {
                        
                        if ($agent.subtype -like $Sensortype -and ( $agent.message.IndexOf("initial") -gt -1 -or $agent.message.IndexOf("Unhandled exception") -gt -1 ) ){
                            $out = New-Object psobject
                            $out | Add-Member NoteProperty Kunde ($customer.name)
                            $out | Add-Member NoteProperty Netzwerk ($container.name)
                            $out | Add-Member NoteProperty System ($sensorhub.name)
                            $out | Add-Member NoteProperty Sensor ($agent.name)
                            $out | Add-Member NoteProperty Nachricht ($agent.message) 
                            $result += $out
                            }
                        }
                    }
                }
            }
        }
    }
$result

