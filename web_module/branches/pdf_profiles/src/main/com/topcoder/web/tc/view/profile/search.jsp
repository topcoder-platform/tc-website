<%@page contentType="text/html"%>
<html>
    <head><title>Placement Profile</title></head>
    <body>

        <form name=frmSearch method=post action="/tc">
        <input type="hidden" name="module" value="PlacementProfile"/>
        <table border=0>
            <tr>
                <td>
                    Handle:
                </td>
                <td>
                    <input type="text" name="handle" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbpsp;
                </td>
                <td>
                    <input type="submit"/>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
