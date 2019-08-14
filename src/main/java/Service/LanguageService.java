package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.LanguageDao;
import Model.Programinglanguage;

@Service
public class LanguageService {
	@Autowired
	private LanguageDao languageDao;
	
	public List<Programinglanguage> getAllLanguage(){
		return languageDao.getAllLanguage();
	}
	
	public int addLanguage(String language) {
		return languageDao.addLanguage(language);
	}
	
	public int delLanguage(Integer id) {
		return languageDao.delLanguage(id);
	}
}
