(require 'cmake-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max) nil)
  )


(defun cmake-insert-sources (str)
  "A function for inserting a source with mapchar"
  (insert "${CMAKE_CURRENT_SOURCE_DIR}/" str "\n")
  )


;; ============================================================
;; From here until the next segmentation comment block, are
;; unit-functions, that generate a single cmake unit
;; ============================================================

(defun cmake-comment-block (blockname)
  "insert a comment block identifying what module/subdir this lists is for"
  (interactive "M block text: ")
  (let ( (block-width 51))
    (let ( (half-block-width (/ (- block-width 3) 2))
           (word-width (length blockname))
           (half-word-width (/ (length blockname) 2)) )
      (let(
           (num-spc-before (- half-block-width (+ half-word-width 2)))
           )
        (let(
             (num-spc-after (- block-width (+ 3 num-spc-before word-width)))
             )
          (insert "#") (insert-char ?=  (- block-width 1) ) (insert "\n")
          (insert "#=") (insert-char ?  (- block-width 3) ) (insert "=\n")
          (insert "#=") (insert-char ?  num-spc-before)  (insert blockname)
          (insert-char ?  num-spc-after)  (insert "=\n")
          (insert "#=") (insert-char ? (- block-width 3)  ) (insert "=\n")
          (insert "#") (insert-char ?= (- block-width 1)  ) (insert "\n")
          )
        )
      )
    )
  )


;; This should take a prefix argument.  By default, insert all
;; subdirectories, when a prefix is passed, only insert those which
;; have a CMakelists.txt.  Or we could even automate the generation of
;; the cmake stuff.
(defun cmake-add-subdirectories ()
  "Insert an 'add_subdirectory' statement for each subdir in cwd"
  (interactive)
  (get-all-subdirectories)
  (dolist (dname tempvar)
    (insert "add_subdirectory(" dname ")\n")
    )
  )

(defun cmake-set-sources (varname)
  "make a list of sources in the current directory"
  (interactive "Mvariable-name: ")
  (insert "SET( " varname "\n")
  (let (
        (src-list (file-expand-wildcards "*.cpp") )
        )
    (mapcar 'cmake-insert-sources src-list)
    )
  (insert " )\n")
  )

(defun cmake-add-install (dest-name install-sub-dir)
  "makes an 'install' statement"
  (let ((install-dir (concat  install-sub-dir)))
    (insert "install (TARGETS " dest-name " DESTINATION " install-dir " ) \n")
    )
  )

(defun cmake-add-library (libname)
  "Makes an 'add_library' statement.  Argument is library name to create."
  (interactive "Mvariable-name: ")
  (let ((varname "srcs"))
    (insert "add_library( " libname " SHARED ${" varname "} )\n")
    )
  )

(defun cmake-add-executable (execname)
  "Makes an 'add_executable' statement"
  (interactive "Mvariable-name: ")
  (let ((varname "srcs"))
    (insert "add_executable( " execname " ${" varname "} )\n")
    )
  )

(defun cmake-add-test (name)
  "Makes an 'add_test' statement"
  (insert "add_test( " name " " name " )\n")
  )

(defun cmake-add-tll (target-name link-libs)
  "Makes a 'target_link_libraries' statement"
  (insert "target_link_libraries( " target-name " \n")
  (mapcar 'insert link-libs)
  (insert "\n)\n")
  )


(defun get-all-subdirectories ()
  "Returns a list of directories in the current working folder"
  (interactive)
  (setq tempvar ())
  (let ((src-list (file-expand-wildcards "*"))
        (retval ()))
    (dolist (fname src-list)
      (when (file-directory-p fname) (push fname tempvar))
      )
    )
  )

;; ================================================================
;;
;; the cml in cmake-cml stands for CMakeLists.  They are functions
;; which create an entire CMakeLists.txt file.
;;
;;  ===============================================================

(defun cmake-cml-library (libname)
  "Create a CMakelists to create a library from all cpp files in dir."
  (interactive "Mlibrary name: ")
  (cmake-comment-block libname)
  (insert "\n")
  (cmake-set-sources "srcs")
  (cmake-add-subdirectories)
  (cmake-add-library libname)
  (cmake-add-install libname "lib")
  (indent-buffer)
  )

(defun cmake-cml-test (suite-name)
  "Generates a test executable for each cpp file.  "
  (interactive "Msuite name: ")
  (let ((src-list (file-expand-wildcards "*.cpp")))
    (cmake-comment-block (concat suite-name " tests"))
    (dolist (fname src-list)
      (let ((test-name (file-name-sans-extension fname)))
        (insert "\n")
        (insert "add_executable( " test-name "  " fname " )\n")
        (cmake-add-tll test-name "${LINK_PATH}/libboost_unit_test_framework.so\n  ${XENTIS_BASE_LIB}")
        (cmake-add-test test-name)
        (cmake-add-install test-name "tests" )
        )
      )
    (indent-buffer)
    )
  )

(defun cmake-cml-subdir (comment-string)
  "Generates a CMakelists which adds to the 'srcs' variable of a parent dir"
  (interactive "Mcomment-string: ")
  (cmake-comment-block comment-string)
  (let ((src-list (file-expand-wildcards "*.cpp")))
    (insert "SET(srcs ${srcs} \n" )
    (dolist (fname src-list)
      (insert "${CMAKE_CURRENT_SOURCE_DIR}/" fname "\n")
      )
    (insert " PARENT_SCOPE)")
    )
  (indent-buffer)
  )

;; doesn't really belong here:
(defun btc-preamble (name)
  " Insert the preamble lines for boost test case"
  (interactive "Mtest module name: ")
  (insert "#define BOOST_TEST_MODULE beetle\n")
  (insert "#define BOOST_TEST_MAIN\n")
  (insert "#include <boost/test/unit_test.hpp>\n")
  )
