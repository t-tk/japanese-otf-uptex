UPTEX = uptex
PTEX = ptex
UPLATEX = uplatex
PLATEX = platex
DVIPS = dvips
DVIPDFMX = dvipdfmx
PDVITYPE = pdvitype

all: uplatex-otf platex-otf uplatex-sp platex-sp

otf: uplatex-otf platex-otf
sp: uplatex-sp platex-sp

uplatex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-uplatex.dvi ; \
	done

platex-otf:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotftest-utf8.tex ; \
		mv uotftest-utf8.dvi uotftest-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotftest-$$opt-v-platex.dvi ; \
	done

uplatex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(UPLATEX) "\def\option{$$opt}\def\class{ujarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-uplatex.dvi ; \
		$(UPLATEX) "\def\option{$$opt}\def\class{utarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-uplatex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-uplatex.dvi ; \
	done

platex-sp:
	for opt in default deluxe expert bold noreplace; do \
		$(PLATEX) "\def\option{$$opt}\def\class{jarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-h-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-h-platex.dvi ; \
		$(PLATEX) "\def\option{$$opt}\def\class{tarticle}\input" uotf-sp-utf8.tex ; \
		mv uotf-sp-utf8.dvi uotf-sp-$$opt-v-platex.dvi ; \
		$(DVIPDFMX) uotf-sp-$$opt-v-platex.dvi ; \
	done

clean:
	rm *.aux *.log *.dvi *.pdf
