# test runner
mxmlc test/src/HamcrestTestRunner.mxml \
 -output=bin/HamcrestTestRunner.swf \
 -debug=true \
 -sp core/src \
 -sp factories/src \
 -sp ../flexunit-adobe/FlexUnitLib/src

# swc
compc \
 -include-sources core/src \
 -include-sources factories/src \
 -output bin/hamcrest-as3.swc

# generate docs
asdoc \
 -doc-sources core/src \
 -doc-sources factories/src \
 -source-path core/src \
 -source-path factories/src \
 -main-title "hamcrest-as3 API Documentation" \
 -window-title "hamcrest-as3 API Documentation" \
 -output doc
