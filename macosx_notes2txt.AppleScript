// set things up
var app = Application.currentApplication();
app.includeStandardAdditions = true;
var notesApp = Application('Notes');
notesApp.includeStandardAdditions = true;

// choose which notes
var notes = notesApp.notes;
var whichNotes = app.chooseFromList(notes.name(), { withPrompt: "Export which Notes to ~/_macosx_notes/ ?", multipleSelectionsAllowed: true });

function html2text(input) {
    var output = input;
    output = output.replace(/<style([\s\S]*?)<\/style>/gi, '');
    output = output.replace(/<script([\s\S]*?)<\/script>/gi, '');
    output = output.replace(/<\/div>/ig, '\n');
    output = output.replace(/<\/li>/ig, '\n');
    output = output.replace(/<li>/ig, '  *  ');
    output = output.replace(/<\/ul>/ig, '\n');
    output = output.replace(/<\/p>/ig, '\n');
    output = output.replace(/<br\s*[\/]?>/gi, "\n");
    output = output.replace(/<[^>]+>/ig, '');

	// multi-lines fix
	//output  = output.replace(/\n{3,}/g, '\n\n').replace(/\n\n/g, '\n');
	output = output.replace(/\n{3,}/g, 'TEMP_NEWLINE').replace(/\n{2}/g, '\n').replace(/TEMP_NEWLINE/g, '\n\n');
	// output = output.replace(/\n{3,}/g, '\n\n').replace(/\n{2}/g, '\n');
    return output;

}

if (whichNotes) {
    // set save location to ~/_fuz_macosx_notes
    var saveWhere = app.pathTo("home folder").toString() + "/_macosx_notes";

    // Check if the directory exists, if not, create it
    var folderExists = app.doShellScript('if [ -d "' + saveWhere + '" ]; then echo "1"; else echo "0"; fi');
    if (folderExists === "0") {
        app.doShellScript('mkdir -p "' + saveWhere + '"');
    }

    if (saveWhere) {
        // loop through all notes
        for (var i = 0; i < notes.length; i++) {
            // is this note one to be exported?
            if (whichNotes.indexOf(notes[i].name()) > -1) {
                // strip the HTML tags
                var content = html2text(notes[i].body());

                // save file as plaintext (.txt)
                var filename = saveWhere + "/" + notes[i].name() + ".txt";
                var file = app.openForAccess(Path(filename), { writePermission: true });
                app.setEof(file, { to: 0 });
                app.write(content, { to: file });
                app.closeAccess(file);
            }
        }
    }
}