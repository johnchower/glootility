CREATE TEMPORARY TABLE user_flash_cat AS
WITH uc_seq AS (
SELECT user_id
     , MAX(sequence_number) AS max_sequence
     , MIN(sequence_number) AS min_sequence
FROM user_connected_to_champion_bridges
GROUP BY user_id
), user_connected_to_remarkable AS(
SELECT 
	u.id AS user_id
	, sum(
		case 
		when c.champion_id=55 then 1
		else 0 
		end
	) AS connected_to_remarkable
FROM user_dimensions u
LEFT JOIN user_connected_to_champion_bridges c
ON u.id=c.user_id
group by u.id
), user_internal_legit AS(
SELECT u.id AS user_id
	, u.email AS user_email
	, u.email IN
		(
		'ashiemke@tangogroup.com'
		,'abooysen@tangogroup.com'
		,'alauderdale@tangogroup.com'
		,'ataujenis@tangogroup.com'
		,'ashafer@tangogroup.com'
		,'apreger@tangogroup.com'
		,'becky@tangogroup.com'
		,'bgreeno@tangogroup.com'
		,'btremper@tangogroup.com'
		,'bboylan@tangogroup.com'
		,'bbonifiled@tangogroup.com'
		,'bschafer@tangogroup.com'
		,'byoung.hsp@gmail.com'
		,'broberts@tangogroup.com'
		,'bgrayless@tangogroup.com'
		,'bjohnson@tangogroup.com'
		,'bmcevoy@tangogroup.com'
		,'bsaltshalcomb@tangogroup.com'
		,'bturney@tangogroup.com'
		,'carolynleeturney@gmail.com'
		,'cgoodroe@tangogroup.com'
		,'cjoyce@tangogroup.com'
		,'cmarks@tangogroup.com'
		,'csmola@tangogroup.com'
		,'chebets@tangogroup.com'
		,'crogers@tangogroup.com'
		,'corey@capelio.com'
		,'dgunter@tangogroup.com'
		,'dclements@tangogroup.com'
		,'dmingo@tangogroup.com'
		,'drouch@tangogroup.com'
		,'dkline@tangogroup.com'
		,'dwilson@tangogroup.com'
		,'ehahn@tangogroup.com'
		,'elehnert@tangogroup.com'
		,'etoy@tangogroup.com'
		,'eschurter@tangogroup.com'
		,'eoneil@tangogroup.com'
		,'eguin@tangogroup.com'
		,'enava@tangogroup.com'
		,'eshirk@tangogroup.com'
		,'eswanson@tangogroup.com'
		,'hellerbach@tangogroup.com'
		,'jstewart@tangogroup.com'
		,'jjacobsen@tangogroup.com'
		,'jvandenberge@tangogroup.com'
		,'jswearingen@tangogroup.com'
		,'jtilley@tangogroup.com'
		,'jwenell@tangogroup.com'
		,'jeffcaliguire@tangogroup.com'
		,'jfray@tangogroup.com'
		,'jbojar@tangogroup.com'
		,'jfishbaugh@tangogroup.com'
		,'jandres@tangogroup.com'
		,'jhinegardner@tangogroup.com'
		,'jmaron@tangogroup.com'
		,'jhower@tangogroup.com'
		,'jcaliguire@tangogroup.com'
		,'jkuster@tangogroup.com'
		,'jcoombs@tangogroup.com'
		,'jofray@tangogroup.com'
		,'jneighbors@tangogroup.com'
		,'jashby@tangogroup.com'
		,'jchadbourne@tangogroup.com'
		,'jvallelonga+notesting@tangogroup.com'
		,'ksmith@tangogroup.com'
		,'kjeremko@tangogroup.com'
		,'kaubertot@tangogroup.com'
		,'kclingersmith@tangogroup.com'
		,'kmorrison@tangogroup.com'
		,'lweiner@tangogroup.com'
		,'lbowdey@tangogroup.com'
		,'lmashkouri@tangogroup.com'
		,'lmarks@tangogroup.com'
		,'lswanson@tangogroup.com'
		,'mgraham@tangogroup.com'
		,'mlupa@tangogroup.com'
		,'msmay@tangogroup.com'
		,'mdavis@tangogroup.com'
		,'mmcconnell@tangogroup.com'
		,'mkatz@tangogroup.com'
		,'mgubba@tangogroup.com'
		,'mtrubacz@tangogroup.com'
		,'mindy.caliguire@tangogroup.com'
		,'mlarsen@tangogroup.com'
		,'mgingrich@tangogroup.com'
		,'nsmith@tangogroup.com'
		,'nykema@tanogroup.com'
		,'nick.smith@tangogroup.com'
		,'nvalencia@tangogroup.com'
		,'nclark@tangogroup.com'
		,'pceron@tangogroup.com'
		,'pkeller@tangogroup.com'
		,'peterhan777@gmail.com'
		,'plarson@tangogroup.com'
		,'rhughey@tangogroup.com'
		,'rschirmer@tangogroup.com'
		,'rmoses@tangogroup.com'
		,'rcarpenter@tangogroup.com'
		,'rortiz@tangogroup.com'
		,'rholdeman@tangogroup.com'
		,'Ryanrtr@gmail.com'
		,'sunrein@tangogroup.com'
		,'smccord@tangogroup.com'
		,'styson@tangogroup.com'
		,'beck@tangogroup.com'
		,'smalone@tangogroup.com'
		,'ssymmank@tangogroup.com'
		,'sconnolly17@gmail.com'
		,'staylor@tangogroup.com'
		,'shannon@bertucc.io'
		,'slindow@tangogroup.com'
		,'serskine86@gmail.com'
		,'smefford@tangogroup.com'
		,'slaflora@tangogroup.com'
		,'sdilla@gmail.com'
		,'stuart@tangogroup.com'
		,'selam@tangogroup.com'
		,'swehrly@tangogroup.com'
		,'srinehart@tangogroup.com'
		,'twolters@tangogorup.com'
		,'tclary@tangogroup.com'
		,'trichards@tangogroup.com'
		,'ttuck@tangogroup.com'
		,'tgroom@tangogroup.com'
		,'tyler.r.briggs89@gmail.com'
		,'tory@tangogroup.com'
		,'vvigil@tangogroup.com'
		,'wlorenzen@tangogroup.com'
		,'wemerson@tangogroup.com'
		)
	AS legit_internal_user
FROM user_dimensions u
), user_flash_facts AS(
SELECT	u.id AS user_id
	, u.email AS user_email
	, u.account_type AS account_type
	, c.champion_id AS first_champion_id
	, cd.name AS first_champion_name 
	, ucr.connected_to_remarkable=1 AS connected_to_remarkable
	, uil.legit_internal_user
FROM 	user_dimensions u
LEFT JOIN user_connected_to_champion_bridges c
	ON u.id=c.user_id
LEFT JOIN uc_seq 
	ON uc_seq.user_id=u.id
LEFT JOIN champion_dimensions cd
	ON cd.id=c.champion_id
LEFT JOIN user_connected_to_remarkable ucr
	ON ucr.user_id=u.id
LEFT JOIN user_internal_legit uil
	ON uil.user_id=u.id
WHERE uc_seq.min_sequence=c.sequence_number
ORDER BY u.id
), ufc AS(
SELECT uff.user_id AS user_id
	, (
		case 
		when uff.legit_internal_user 
			AND uff.user_email IS NOT NULL
			then 'Internal'
		when uff.first_champion_id IN 
			(3,4,88,20,6,26,56,39,43) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then uff.first_champion_name
		when uff.first_champion_id IN 
			(5,182,34,136,45,69,95,94,93,29,83) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'Cru'
		when uff.first_champion_id IN 
			(92,14,91,32) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'CFP'
		when uff.first_champion_id IN 
			(2,7) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'CeDAR'	
		when uff.first_champion_id IN 
			(37,24,42) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'Date Night'	
		when uff.first_champion_id IN 
			(11,23,98) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'TYRO'
		when uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			AND NOT u.account_type='Internal User'
			then 'Remarkable!'
		when uff.first_champion_id NOT IN 
			(1,2,3,4,5
			,6,7,9,11,13
			,14,20,23,24,26
			,29,31,32,34,43
			,44,45,53,55,56
			,69,83,88,91,92
			,93,94,95,98,108
			,128,130,132,136,137
			,77,57,54,51,50
			,81,78,65,171,18
			,79,41,16,33,17
			,113,116,115,48,152
			,147,47,39) 
			AND NOT u.account_type='Internal User'
			AND NOT uff.connected_to_remarkable
			AND uff.user_email IS NOT NULL
			then 'Other'
		when uff.user_email IS NULL
			then 'Guest'
		else 'Uncategorized' 
		end
	) AS flash_report_category
FROM user_flash_facts uff
LEFT JOIN user_dimensions u
	ON u.id=uff.user_id
), user_flash_cat AS(
select distinct * from ufc
where flash_report_category!='Uncategorized'
and flash_report_category!='Guest'
order by user_id
)
select * from user_flash_cat
;
