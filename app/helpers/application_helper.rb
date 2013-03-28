module ApplicationHelper
	def ext_url(url)
		return 'http://www.google.com' if url.blank?
		if url.starts_with?('http://')
			return url
		else
			return "http://" + url
		end
	end

	def disp_date(date)
		if date.blank?
			"Unknown Date"
		else
			date.strftime("%m/%d/%Y")
		end
	end

end
