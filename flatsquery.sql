SELECT 
	tbl_flats.ID, 
	tbl_flats.flatNumber, 
	tbl_flats.Floor, 
	tbl_flats.flatConfiguration, 
	tbl_flats.Wing, 
	tbl_flats.propertyId, 
	tbl_property.propertyName, 
	tbl_property.propertyType, 
	tbl_property.propertyPlotNumber, 
	tbl_property.propertyLocality, 
	tbl_property.propertyCity, 
	tbl_property.propertyState, 
	tbl_property.propertyPincode, 
	tbl_developer.developerCompanyName, 
	tbl_developer.developerId, 
	tbl_flatConfiguration.flatConfiguration, 
	tbl_flatConfiguration.floorPlan, 
	tbl_flatConfiguration.BuildArea, 
	tbl_flatConfiguration.CarpetArea, 
	tbl_flatConfiguration.faceDirection, 
	tbl_flatConfiguration.primaryBasePrice
FROM tbl_flats inner join tbl_property
	ON tbl_property.propertyId = tbl_flats.propertyId
FROM (tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId) 
INNER JOIN (tbl_flatConfiguration 
INNER JOIN tbl_flats ON tbl_flatConfiguration.ID = tbl_flats.flatConfiguration) ON tbl_property.ID = tbl_flats.propertyId;
