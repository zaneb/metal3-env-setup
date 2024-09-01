# Read the journal from an agent-gather archive with journalctl arguments
gatherctl() {
    local gather="$1"
    shift

    local base
    base="$(basename "${gather}" | sed 's/\.t\(\(ar\(\.[xg]z\)\?\)\|gz\)$//')"
    local tempdir
    tempdir="$(mktemp -d "/tmp/${base}-XXXXXXXX")"
    /lib/systemd/systemd-journal-remote -o "${tempdir}/${base}.journal" <(tar -xOaf "${gather}" "agent-gather/journal.export") && \
        journalctl -D "${tempdir}" "$@"
    rm -r "${tempdir}"
}
