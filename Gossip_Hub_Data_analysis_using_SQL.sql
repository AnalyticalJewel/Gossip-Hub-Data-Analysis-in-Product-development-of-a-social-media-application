
 /*The number of peoples given the 5 star rating to the different version of whatsapp */
SELECT 
    AppVersion,
    sum(rating_5) AS Number_of_people_given_5_star_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY Number_of_people_given_5_star_rating DESC;

/*The number of peoples given the 4 star rating to the different version of whatsapp */
SELECT 
    AppVersion,
    sum(rating_4) AS Number_of_people_given_4_star_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY Number_of_people_given_4_star_rating DESC;

/*number of peoples given 1 star rating*/
SELECT 
    AppVersion,
    sum(rating_1) AS Number_of_people_given_1_star_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY Number_of_people_given_1_star_rating DESC;

/*Number of people given 2 star rating*/
SELECT 
    AppVersion,
    sum(rating_2) AS Number_of_people_given_2_star_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY Number_of_people_given_2_star_rating DESC;

/*number of peoples given good rating*/
SELECT 
    AppVersion,
    sum(rating_4+rating_5) AS good_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY good_rating DESC;

/*Number of peoples given poor rating*/
SELECT 
    AppVersion,
    sum(rating_1+rating_2) AS poor_rating
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
ORDER BY poor_rating DESC;

/* Good rating+poor rating + app version*/
SELECT 
    AppVersion,
    SUM(rating_1 + rating_2) AS poor_rating,
    SUM(rating_4 + rating_5) AS good_rating,
    (SUM(rating_4 + rating_5) / (SUM(rating_1 + rating_2 + rating_4 + rating_5))) * 100 AS percentage_of_popularity_of_version,
    SUM(thumbsUpCount) AS total_thumbsup
FROM
    app
WHERE
    AppVersion != 'nan'
GROUP BY AppVersion
HAVING good_rating >= 5
ORDER BY good_rating DESC;


