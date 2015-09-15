;;; .emacs -- my .emacs

;;; Commentary:
;; Define my custom elisp location, and load the common init.

; this is added by package.el
(package-initialize)

(defvar personal-project-path "~/repos/glens_elisp")
(add-to-list 'load-path  personal-project-path )
(load "common-init.el")
(load "devel-stuff.el")
(load "org-mode.el")
(load "keybindings.el")
(load "refactoring.el")

;;  I share my emacs location among multiple machines.
;;  At work I need a certain configuration,
;;  I prefer a different one at home and on my private laptop.
;;  I currenlty find the simplest solution to maintain location
;;  specific stuff in a seprate file, and symbolically link it
;;  to "location_specific.el".
(load "location_specific.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
	("/home/stark/repos/writing/Drugwar/effective_advocacy.org" "/home/stark/repos/writing/Drugwar/drug_war_alternative.org" "/home/stark/repos/writing/Drugwar/cost_function.org" "/home/stark/repos/writing/cmake.org" "/home/stark/repos/writing/dear_scott_0.org" "/home/stark/repos/writing/diaries/work2009.org" "/home/stark/repos/writing/diaries/journal.org" "/home/stark/repos/writing/diaries/diary_2010.org" "/home/stark/repos/writing/diaries/diary2012.org" "/home/stark/repos/writing/diaries/diary2010.org" "/home/stark/repos/writing/diaries/2015.org" "/home/stark/repos/writing/diaries/2014.org" "/home/stark/repos/writing/diaries/2012.org" "/home/stark/repos/writing/evolutionary_communist_maifesto.org" "/home/stark/repos/writing/gw.org" "/home/stark/repos/writing/moral_framework.org" "/home/stark/repos/writing/posts.org" "/home/stark/repos/writing/progUnion.org" "/home/stark/repos/writing/programming/unit_testing.org" "/home/stark/repos/writing/resources_cpp.org" "/home/stark/repos/writing/units_of_harm.org" "/home/stark/repos/writing/up.org" "/home/stark/repos/pscppp/examples/notes.org" "/home/stark/repos/pscppp/notes.org" "/home/stark/repos/projects/ComicTagger/notes.org" "/home/stark/repos/projects/Tiberius/Experiments/notes.org" "/home/stark/repos/projects/Tiberius/Backtesting/Data/notes.org" "/home/stark/repos/projects/Tiberius/Backtesting/Reporting/notes.org" "/home/stark/repos/projects/Tiberius/Backtesting/notes.org" "/home/stark/repos/projects/Turingverse/turingverse.org" "/home/stark/repos/projects/Webpage/why_you_should_break_free_of_guis.org" "/home/stark/repos/projects/Webpage/what_if_fascism.org" "/home/stark/repos/projects/Webpage/sane_drug_policy.org" "/home/stark/repos/projects/Webpage/published/cannabis_and_diabetes.org" "/home/stark/repos/projects/Webpage/misc_drug_rants.org" "/home/stark/repos/projects/Webpage/linuxToolsl.org" "/home/stark/repos/projects/Webpage/libyopera.org" "/home/stark/repos/projects/Webpage/java_gripes.org" "/home/stark/repos/projects/Webpage/gsnet_notes.org" "/home/stark/repos/projects/Webpage/creative_makefile_use.org" "/home/stark/repos/projects/ast.org" "/home/stark/repos/projects/benchmarking/notes.org" "/home/stark/repos/projects/free_software_stuff.org" "/home/stark/repos/projects/il8n/utf8.org" "/home/stark/repos/projects/il8n/notes.org" "/home/stark/repos/projects/il8n/README.org" "/home/stark/repos/projects/iwyu/notes.org" "/home/stark/repos/projects/lists_vs_vector.org" "/home/stark/repos/projects/make.org" "/home/stark/repos/projects/nfs.org" "/home/stark/repos/projects/pan.org" "/home/stark/repos/projects/prof_dev.org" "/home/stark/repos/projects/projects.org" "/home/stark/repos/projects/songs/learn.org" "/home/stark/repos/projects/stats/notes.org" "/home/stark/repos/projects/stenographer/notes.org" "/home/stark/repos/private/Jobsearch/search_2013.org" "/home/stark/repos/private/bookkeeping/taxes/taxes.org" "/home/stark/repos/private/likealeash.org" "/home/stark/repos/private/movies.org" "/home/stark/repos/private/puzzles.org" "/home/stark/repos/private/recipes.org" "/home/stark/repos/private/songs/songs.org" "/home/stark/repos/private/songs.org" "/home/stark/repos/private/travel.org" "/home/stark/repos/private/woodworking.org" "/home/stark/repos/ostream_indenter/README.org" "/home/stark/repos/glens_elisp/notes.org" "/home/stark/repos/gix/Qix.org" "/home/stark/repos/cleanup_tools/notes.org" "/home/stark/repos/VolTS/backup/src/notes.org" "/home/stark/repos/VolTS/backup/notes.org" "/home/stark/repos/VolTS/notes.org" "/home/stark/repos/VolTS/src/notes.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
