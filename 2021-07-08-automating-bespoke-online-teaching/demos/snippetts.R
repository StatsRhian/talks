# Snippet:

make_ballot =
  function (question, choices){
    df = tibble::tibble()
    df[1, choices] = NA
    df %>%
      flextable::flextable() %>%
      flextable::add_header_row(values = question,
                                colwidths = length(choices))%>%
      flextable::theme_box() %>%
      flextable::align(align = "center", part = "all")
  }

render_docx = function(){
  course_info = get_course_info()
  extdata = read_upcoming()$extdata
  rmarkdown::render("index.Rmd", output_format = "word_document",
                    params = list(asana = course_info, extdata = extdata))
}

upload_docx = function (public = TRUE){
  check_google_user()
  course_info = get_course_info()
  filename = construct_gdoc_filename(course_info)
  client_dir = get_client_dir_id(course_info)
  upload = googledrive::drive_upload("index.docx", name = filename,
                                     overwrite = TRUE, type = "document", path = client_dir)
  if (isTRUE(public)) {
    googledrive::drive_share(upload, role = "writer", type = "anyone")
  }
  web_link = upload$drive_resource[[1]]$webViewLink[1]
  message(glue::glue("\n\nDocument uploaded to: {web_link}"))
  return(invisible(web_link))
}


# jrDroplet

- Get details from Asana
    - Client name
    - Course tag
    - Trainer
deets = asana_vm_details(asana_task_id)
config = create_droplet_from_config(merge_config(droplet_config("training"),
                                                 deets), allow_existing = allow_existing, allow_name_change = allow_name_change)
if (notify) {
  notify_create(config)
