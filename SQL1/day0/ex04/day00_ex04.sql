SELECT format('%s (age:%s,gender:''%s'',address:''%s'')',
              name, age, gender, address) person_information from  person
ORDER BY person_information;