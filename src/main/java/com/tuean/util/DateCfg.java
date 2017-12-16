package com.tuean.util;

import java.util.Date;
import java.util.GregorianCalendar;

public final class DateCfg {
	private DateCfg() {
	}

	public static Date getSysDate() {
		return new GregorianCalendar().getTime();
	}
}
