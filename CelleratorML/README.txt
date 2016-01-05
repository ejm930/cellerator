CelleratorML.nb
---------------

CelleratorML is a package that allows the storage and retrieval of
Cellerator and Cellzilla models in an ASCII text format using XML. 
The name of the XML format is CelleratorML (for Cellerator) and
CellzillaML (for Cellzilla). 

It is fully compatible with all Cellerator and xlr8r models. 

CelleratorML.m has been tested with Mathematica 6.0.3 and 7.0.1.
Compatibility with earlier versions has not been tested.

Contents of the archive:
-----------------------
CelleratorML.nb - source code for Mathematica package

CelleratorML.m - Mathematica package

html - a folder containing full documentation of the pacakge as well
as the xml spec. Load the file index.html into your web browser.

Examples - a folder containing a full example showing an xlr8r simulation,
a Cellzilla simulation, generation of xml files from each, re-reading the
xml files, and regeneration of the simulations from the xml files.

license.txt - the software license (LGPL).

Other files may include additional information about the software.

Installation:
------------
Place CelleratorML.m in any folder contained in your Mathematica
path. To find your Mathematica path, open Mathematica and type $Path. 

For most applications you will also need to install xlr8r.m (xCellerator). 
See http://xlr8r.info for installation instructions. ( While mathsbml.m is
not explicitly required for CelleratorML, some functionality of xlr8r requires
mathsbml, which will be automatically installed when you install xlr8r.) 

For multi-cellular applications you will also need to install Celliza2D. See
http://cellzilla.info for installation instructions. You can also use older 
versions of cellzilla, but tissue structures will not be supported.
( For older users of Cellzilla, Cellzilla2D retains all the two dimensional 
functionality of Cellzilla but does not depend on mpower or qhull and does
not require any separate Fortran binary installations. )




