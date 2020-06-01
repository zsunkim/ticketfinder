package ticket.finder.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(Exception.class)
	public String execeptionHandler(Exception exception, Model model) {
		exception.printStackTrace();
		return "user/include/error";
	}
}
