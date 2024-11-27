SELECT Themes.Name AS Theme_Name,
    Components.Name AS Component_Name,
    Datasets.Name AS Dataset_Name,
    Indicators.Name AS Indicator_Name,
    Components.id AS Component_ID,
    Indicators.id AS Indicator_ID,
    Themes.id AS Theme_ID,
    Datasets.id AS Dataset_ID
    
FROM Indicators
    JOIN Components ON Indicators.Component = Components.id
    JOIN Themes ON Components.Theme = Themes.id
    JOIN Datasets ON Indicators.Dataset = Datasets.id