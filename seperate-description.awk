awk -F'\"' 'BEGIN {
    OFS=",";
    print "ItemID,UPC,BasePrice,IMAP,BHG Brand Name,Status,Title,Description,Notes,Image URL";  
}
NR > 1 {
    desc_col = $2;
    pre_desc = $1;
    # Split into Title and New Description
    split(desc_col, parts, /, /);
    #split the stuff before that
    split(pre_desc, parts2, ",");
    title = parts[1];
    new_desc = substr(desc_col, length(title) + 3);
    # Rebuild the line with new columns
    #print $1 $2 $3 $4 $5 ""title"","\""new_desc"\"" ;
    print parts2[1],parts2[2],parts2[3],parts2[4],parts2[5],parts2[6],parts2[7] ""title"","\""new_desc"\"" $3;
}' 9-bracelets.csv > p-9-bracelets.csv
