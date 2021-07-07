.PHONY: publish clean force

index.docx: gdoc_content.Rmd upcoming_course.yml
	Rscript -e 'jrNotes2::render_docx()'

publish: index.docx
	Rscript -e 'jrNotes2::upload_docx()'

clean:
	rm index.docx

force:
	touch gdoc_content.Rmd
	$(MAKE)
