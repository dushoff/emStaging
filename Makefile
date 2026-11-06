## This is emStaging

current: target
-include target.mk
Ignore = target.mk

vim_session:
	bash -ic "vmt"

## -include makestuff/perl.def

######################################################################

Ignore += $(wildcard *.pdf)

targets: CohortPlot.Rout.pdf lsFig.Rout.pdf rcHist.Rout.pdf TimeEvolutionStack.Rout.pdf

######################################################################

Sources += $(wildcard *.R *.mk)
Sources += $(wildcard slow/*)
autopipeR = defined

## content.mk

CohortPlot.Rout: CohortPlot.R plotStyle.R slow/CohortSim.rda params.rda
slow/CohortSim.Rout: CohortSim.R params.rda funs.rda ;

slowcrib = $(CP) ../kappaCode/slow/$(notdir $@) $@

######################################################################

%.R:
	$(CP) ../kappaCode/$@ .

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

## ln -s ../makestuff . ## Do this first if you want a linked makestuff
Ignore += makestuff*.stamp
Makefile: makestuff00.stamp
makestuff%.stamp: | makestuff
	- $(RM) makestuff*.stamp
	cd makestuff && $(MAKE) pull
	touch $@
makestuff:
	git clone --depth 1 $(msrepo)/makestuff

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/slowtarget.mk

-include makestuff/git.mk
-include makestuff/visual.mk
