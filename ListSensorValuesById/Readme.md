# ListSensorValuesById.ps1

Creates an excel file with a report of all sensors (and the last message of the sensor) specified by the sensorID. The script iterates over all customers and sensorhubs to create the list. The script takes two parameters: apiKey and sensorID

## Call
```
ListSensorValuesById.ps1 -apiKey yourApiKey SensorID
```

## Parameters

### apiKey
The api-Key of the user.

