package com.ask.dental.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExampleController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test/Example.do", method = RequestMethod.GET)
	public String Example(Locale locale, Model model) {
		return "test/Example";
	}
	
	@RequestMapping(value = "/test/Example2.do", method = RequestMethod.POST)
	public String Example2(Locale locale, Model model) {
		return "test/Example2";
	}
	
}
